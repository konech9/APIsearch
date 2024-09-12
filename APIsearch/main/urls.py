from django.urls import path
from . import views
from .views import register, login_view, logout_view

urlpatterns = [
    path('api-list/', views.api_list, name='api_list'),  # Маршрут для списка API
    path('register/', register, name='register'),
    path('login/', login_view, name='login'),
    path('logout/', logout_view, name='logout'),
]


