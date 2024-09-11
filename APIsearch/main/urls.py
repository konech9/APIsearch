from django.urls import path
from . import views

urlpatterns = [
    path('api-list/', views.api_list, name='api_list'),  # Маршрут для списка API
]


