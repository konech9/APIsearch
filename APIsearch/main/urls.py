from django.urls import path
from . import views
from .views import register, login_view, logout_view

urlpatterns = [
    path('api-list/', views.api_list, name='api_list'),  # Маршрут для списка API
    path('register/', views.register, name='register'),
    path('login/', views.login_view, name='login'),
    path('logout/', views.logout_view, name='logout'),
    path('profile/', views.profile, name='profile'),
]


