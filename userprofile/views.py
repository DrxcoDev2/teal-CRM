from django.contrib.auth.forms import UserCreationForm
from django.shortcuts import render

from .models import Userprofile

def signup(request):
    if request.method == 'POST':
        form = UserCreationForm(request.POST)

        if form.is_valid():
            user = form.save()
            userprofile = Userprofile.objects.create(user=user)
    form = UserCreationForm()

    return render(request, 'userprofile/signup.html', {
        'form': form
    })
