"""
Definition of forms.
"""

from django import forms
from app.models import Question,Choice,User,Pregunta,Opcion
from django.contrib.auth.forms import AuthenticationForm
from django.utils.translation import ugettext_lazy as _

class QuestionForm(forms.ModelForm):

        class Meta:
            model = Question
            fields = ('question_text',)

class ChoiceForm(forms.ModelForm):

        class Meta:
            model = Choice
            fields = ('choice_text',)

class PreguntaForm(forms.ModelForm):

        class Meta:
            model = Pregunta
            fields = ('enunciado','numOpc','tema',)

class OpcionForm(forms.ModelForm):

        class Meta:
            model = Opcion
            fields = ('opcion','votos','correcta',)

class UserForm(forms.ModelForm):

        class Meta:
            model = User
            fields = ('email','nombre',)

class BootstrapAuthenticationForm(AuthenticationForm):
    """Authentication form which uses boostrap CSS."""
    username = forms.CharField(max_length=254,
                               widget=forms.TextInput({
                                   'class': 'form-control',
                                   'placeholder': 'User name'}))
    password = forms.CharField(label=_("Password"),
                               widget=forms.PasswordInput({
                                   'class': 'form-control',
                                   'placeholder':'Password'}))
