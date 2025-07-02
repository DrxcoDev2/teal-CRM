from django.shortcuts import render
from django.contrib.auth.forms import UserCreationForm


def singup(request):
    form = UserCreationForm()

    return render(request, 'userprofile/singup.html')
