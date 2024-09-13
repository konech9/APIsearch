from django.urls import path
from . import views
from .views import register, login_view, logout_view

urlpatterns = [
    path('api_list/', views.api_list, name='api_list'),  # URL for listing APIs
    path('api/<int:api_id>/', views.api_detail, name='api_detail'),  # URL for API detail page
    path('register/', views.register, name='register'),
    path('login/', views.login_view, name='login'),
    path('logout/', views.logout_view, name='logout'),
    path('profile/', views.profile, name='profile'),
    path('lk/', views.lk_view, name='lk'),
    # path('media/<path:path>', serve, {'document_root': settings.MEDIA_ROOT}),
    # path('static/<path:path>', serve, {'document_root': settings.STATIC_ROOT}),
]


