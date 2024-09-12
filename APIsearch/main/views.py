from django.shortcuts import render, redirect
from .models import API
from django.contrib.auth import login, authenticate, logout
from django.contrib.auth.decorators import login_required
from .forms import CustomUserCreationForm, CustomAuthenticationForm


def api_list(request):
    # Фильтры
    #category = request.GET.get('category')
    apis = API.objects.all()

    # if category:
    #     apis = apis.filter(category=category)

    context = {
        'apis': apis,
    }
    return render(request, 'main/api_list.html', context)


def register(request):
    if request.method == 'POST':
        form = CustomUserCreationForm(request.POST)
        if form.is_valid():
            user = form.save()
            login(request, user)
            return redirect('api_list')  # Перенаправление на страницу после регистрации
    else:
        form = CustomUserCreationForm()
    return render(request, 'main/register.html', {'form': form})


def login_view(request):
    if request.method == 'POST':
        form = CustomAuthenticationForm(request, data=request.POST)
        if form.is_valid():
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password')
            user = authenticate(request, username=username, password=password)
            if user is not None:
                login(request, user)
                return redirect('api_list')  # Перенаправление на страницу после входа
    else:
        form = CustomAuthenticationForm()
    return render(request, 'main/login.html', {'form': form})


def logout_view(request):
    logout(request)
    return redirect('login')