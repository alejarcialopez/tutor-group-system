"""
URL routing schema for tutor-group-system.

"""

from django.urls import path

from . import views

app_name = "tutor-group-system"

urlpatterns = [
    path('example', views.example, name='example'),
]
