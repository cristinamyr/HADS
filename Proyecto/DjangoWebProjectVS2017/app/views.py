"""
Definition of views.
"""

from django.shortcuts import render,get_object_or_404
from django.http import HttpRequest
from django.template import RequestContext
from datetime import datetime
from django.http.response import HttpResponse, Http404
from django.http import HttpResponseRedirect, HttpResponse
from .models import Question,Choice,User,Pregunta,Opcion
from django.template import loader
from django.core.urlresolvers import reverse
from app.forms import QuestionForm, ChoiceForm,UserForm,PreguntaForm,OpcionForm
from django.shortcuts import redirect
import json
from django.db import connection
from django.db.models import F




def home(request):
    """Renders the home page."""
    assert isinstance(request, HttpRequest)
    return render(
        request,
        'app/index.html',
        {
            'title':'Home Page',
            'year':datetime.now().year,
        }
    )

def contact(request):
    """Renders the contact page."""
    assert isinstance(request, HttpRequest)
    return render(
        request,
        'app/contact.html',
        {
            'title':'Autor de la web',
            'message':'Datos de contacto',
            'year':datetime.now().year,
        }
    )

def about(request):
    """Renders the about page."""
    assert isinstance(request, HttpRequest)
    return render(
        request,
        'app/about.html',
        {
            'title':'About',
            'message':'Your application description page.',
            'year':datetime.now().year,
        }
    )
def index(request):
    latest_question_list = Question.objects.order_by('-pub_date')
    template = loader.get_template('polls/index.html')
    context = {
                'title':'Lista de preguntas de la encuesta',
                'latest_question_list': latest_question_list,
              }
    return render(request, 'polls/index.html', context)

def index_pregunta(request):
    try:
        temaElegido = request.POST['temas']
    except (KeyError, Choice.DoesNotExist):
         latest_question_list = Pregunta.objects.order_by('-enunciado')
         row = Pregunta.objects.values('tema').distinct()
         template = loader.get_template('quiz/index.html')
         context = {
                'title':'Lista de preguntas del quiz',
                'latest_question_list' : latest_question_list,
                'temas':row
              }
         return render(request, 'quiz/index.html', context)
    else:
        latest_question_list = Pregunta.objects.order_by('-enunciado')
        row = Pregunta.objects.values('tema').distinct()
        preguntas = Pregunta.objects.filter(tema__contains='Prueba')
        template = loader.get_template('quiz/index.html')
        context = {
                'title':'Lista de preguntas del quiz con el tema ',
                'latest_question_list' : latest_question_list,
                'temas':row,
                'valido':"true",
                'preguntas':preguntas,
                'tema':temaElegido
              }
        return render(request, 'quiz/index.html', context)

def detail(request, question_id):
     question = get_object_or_404(Question, pk=question_id)
     return render(request, 'polls/detail.html', {'title':'Respuestas asociadas a la pregunta:','question': question})

def detalles(request, pregunta_id):
     pregunta = get_object_or_404(Pregunta, pk=pregunta_id)
     return render(request, 'quiz/detail.html', {'title':'Respuestas asociadas a la pregunta:','pregunta': pregunta,})

def results(request, question_id):
    question = get_object_or_404(Question, pk=question_id)
    return render(request, 'polls/results.html', {'title':'Resultados de la pregunta:','question': question})

def resultados(request, pregunta_id,answer_id):
    question = get_object_or_404(Pregunta, pk=pregunta_id)
    respuesta = get_object_or_404(Opcion, pk=answer_id)
    if respuesta.correcta == 1:
        mensaje = "Has respondido correctamente la pregunta"
    else:
        mensaje = "No has respondido correctamente la pregunta"
    return render(request, 'quiz/resultados.html', {'title':'Resultados de la pregunta:','pregunta': question, 'mensaje' : mensaje})

def vote(request, question_id):
    p = get_object_or_404(Question, pk=question_id)
    try:
        selected_choice = p.choice_set.get(pk=request.POST['choice'])
    except (KeyError, Choice.DoesNotExist):
        # Vuelve a mostrar el form.
        return render(request, 'polls/detail.html', {
            'pregunta': p,
            'error_message': "ERROR: No se ha seleccionado una opcion",
        })
    else:
        selected_choice.votes += 1
        selected_choice.save()
        # Siempre devolver un HttpResponseRedirect despues de procesar
        # exitosamente el POST de un form. Esto evita que los datos se
        # puedan postear dos veces si el usuario vuelve atras en su browser.
        return HttpResponseRedirect(reverse('results', args=(p.id,)))

def votar(request, pregunta_id):
    p = get_object_or_404(Pregunta, pk=pregunta_id)
    try:
        selected_choice = p.opcion_set.get(pk=request.POST['choice'])
    except (KeyError, Opcion.DoesNotExist):
        # Vuelve a mostrar el form.
        return render(request, 'quiz/detail.html', {
            'pregunta': p,
            'error_message': "ERROR: No se ha seleccionado una opcion",
        })
    else:
        selected_choice.votos += 1
        selected_choice.save()
        return HttpResponseRedirect(reverse('resultados', args=(pregunta_id,selected_choice.id,)))


def question_new(request):
        if request.method == "POST":
            form = QuestionForm(request.POST)
            if form.is_valid():
                question = form.save(commit=False)
                question.pub_date=datetime.now()
                question.save()
                #return redirect('detail', pk=question_id)
                #return render(request, 'polls/index.html', {'title':'Respuestas posibles','question': question})
        else:
            form = QuestionForm()
        return render(request, 'polls/question_new.html', {'form': form})

def pregunta_nueva(request):
    if request.method == "POST":
        form = PreguntaForm(request.POST)
        if form.is_valid():
            pregunta = form.save(commit=False)
            if(pregunta.numOpc<2 or pregunta.numOpc>4):
                 return render(request, 'quiz/nueva_pregunta.html', {'form': form,'error_message': "ERROR: El número de opciones establecido no es correcto. Debe ser un valor entre 2 y 4"})
            else:
                pregunta.save()
                latest_question_list = Pregunta.objects.order_by('-enunciado')
                template = loader.get_template('quiz/index.html')
                context = {
                    'title':'Lista de preguntas del quiz',
                    'latest_question_list' : latest_question_list,
                    'accept_message': "Pregunta añadida correctamente!!!"
                  }
                return render(request, 'quiz/index.html', context)
    else:
        form = PreguntaForm()
    return render(request, 'quiz/nueva_pregunta.html', {'form': form})

def choice_add(request, question_id):
        question = Question.objects.get(id = question_id)
        if request.method =='POST':
            form = ChoiceForm(request.POST)
            if form.is_valid():
                choice = form.save(commit = False)
                choice.question = question
                choice.vote = 0
                choice.save()         
                #form.save()
        else: 
            form = ChoiceForm()
        #return render_to_response ('choice_new.html', {'form': form, 'poll_id': poll_id,}, context_instance = RequestContext(request),)
        return render(request, 'polls/choice_new.html', {'title':'Pregunta:'+ question.question_text,'form': form})

def anadir_opc(request, pregunta_id):
        pregunta = Pregunta.objects.get(id = pregunta_id)
        if request.method =='POST':
            form = OpcionForm(request.POST)
            if form.is_valid():
                opcion = form.save(commit = False)
                opcion.pregunta = pregunta
                opcion.votos = 0
                opcion.save() 
                form = OpcionForm()
                return render(request, 'quiz/nueva_opcion.html', {'title':'Pregunta:'+ pregunta.enunciado,'form': form,'pregunta': pregunta,'max': pregunta.opcion_set.all})

                #form.save()
        else: 
            form = OpcionForm()
        #return render_to_response ('choice_new.html', {'form': form, 'poll_id': poll_id,}, context_instance = RequestContext(request),)
        return render(request, 'quiz/nueva_opcion.html', {'title':'Pregunta:'+ pregunta.enunciado,'form': form,'pregunta': pregunta,'max': pregunta.opcion_set.all})

def chart(request, question_id):
    q=Question.objects.get(id = question_id)
    qs = Choice.objects.filter(question=q)
    dates = [obj.choice_text for obj in qs]
    counts = [obj.votes for obj in qs]
    context = {
        'dates': json.dumps(dates),
        'counts': json.dumps(counts),
    }

    return render(request, 'polls/grafico.html', context)

def grafico(request, pregunta_id):
    q=Pregunta.objects.get(id = pregunta_id)
    qs = Opcion.objects.filter(pregunta=q)
    dates = [obj.opcion for obj in qs]
    counts = [obj.votos for obj in qs]
    context = {
        'dates': json.dumps(dates),
        'counts': json.dumps(counts),
    }

    return render(request, 'quiz/grafico.html', context)

def user_new(request):
        if request.method == "POST":
            form = UserForm(request.POST)
            if form.is_valid():
                user = form.save(commit=False)
                user.save()
                #return redirect('detail', pk=question_id)
                #return render(request, 'polls/index.html', {'title':'Respuestas posibles','question': question})
        else:
            form = UserForm()
        return render(request, 'polls/user_new.html', {'form': form})

def users_detail(request):
    latest_user_list = User.objects.order_by('email')
    template = loader.get_template('polls/users.html')
    context = {
                'title':'Lista de usuarios',
                'latest_user_list': latest_user_list,
              }
    return render(request, 'polls/users.html', context)