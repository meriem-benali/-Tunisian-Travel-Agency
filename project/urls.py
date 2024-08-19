"""
URL configuration for project project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from django.views.generic.base import TemplateView
from main import views

urlpatterns = [
    #path admin
    #path('admin/', admin.site.urls),
    path('support/dashboard/',views.Dashboard),
    path('logout/',views.Logout),
    path('support/reservation/',views.AllReservations),
    path('support/users/',views.AllUsers),
    
    
    #path users
    path('', TemplateView.as_view(template_name='first-page.HTML') ),
    path('first/', TemplateView.as_view(template_name='acceuil.html') ),
    path('login/',views.Login ),
    path('signup/tunisian/',views.CreateUser ),
    path('signup/foreign/', views.CreateUserf ),
    path('home/', TemplateView.as_view(template_name='page.HTML') ),
    path('region/', views.Regions),
    path('reservation/', views.Reservations),
    path('route/', TemplateView.as_view(template_name='route.html')),
    path('profile/',views.UserProfile ),
    
]
