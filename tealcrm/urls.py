
from django.contrib import admin
from django.urls import path

from core.views import index, about
from userprofile.views import singup

urlpatterns = [
    path('', index, name='index'),
    path('about/', index, name='about'),
    path('sign-up/', index, name='signup'),
    path('admin/', admin.site.urls),
]
