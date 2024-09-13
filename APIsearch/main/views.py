from django.shortcuts import render, redirect
from .models import API
from django.contrib.auth import login, authenticate, logout
from django.contrib.auth.decorators import login_required
from .forms import UserRegisterForm, UserLoginForm
from django.contrib.auth.forms import AuthenticationForm
from django.contrib import messages
from django.shortcuts import render, get_object_or_404

def api_list(request):
    apis = API.objects.all()  # Fetch all APIs from the database
    return render(request, 'api_list.html', {'apis': apis})


def api_detail(request, api_id):
    api = get_object_or_404(API, id=api_id)  # Fetch specific API based on its ID
    return render(request, 'api_detail.html', {'api': api})


def register(request):
    if request.method == 'POST':
        form = UserRegisterForm(request.POST)
        if form.is_valid():
            # Сохраняем пользователя
            user = form.save()

            # Логиним пользователя после успешной регистрации
            login(request, user)

            # Перенаправляем на страницу профиля или другую страницу
            return redirect('profile')

        else:
            # Если форма не валидна, можно вывести ошибки для отладки
            print(form.errors)

    else:
        # Если запрос GET, создаем пустую форму
        form = UserRegisterForm()

    # Рендерим шаблон с формой
    return render(request, 'register.html', {'form': form})


# def login_view(request):
#     print("login")
#     if request.method == 'POST':
#         print(request)
#         form = UserLoginForm(request, data=request.POST)
#         # print(f"'{form.username}'")
#         # print(f"'{form.password}'")
#         if form.is_valid():
#             username = form.cleaned_data.get('username')
#             password = form.cleaned_data.get('password')
#             user = authenticate(username=username, password=password)
#             if user is not None:
#                 login(request, user)
#                 return redirect('profile')
#             else:
#                 print('User is none')
#         else:
#             print('Form not valid')
#     else:
#         form = UserLoginForm()
#         print('Not post')
#     return render(request, 'login.html', {'form': form})


def login_view(request):
    if request.method == 'POST':
        form = AuthenticationForm(data=request.POST)
        #print(f"'{form.username}'")
        #print(f"'{form.password}'")
        if form.is_valid():
            user = form.get_user()
            login(request, user)
            return redirect('profile')  # Перенаправление на профиль после входа
        else:
            print('Form not valid')
    else:
        form = AuthenticationForm()
    return render(request, 'login.html', {'form': form})


@login_required
def profile(request):
    return render(request, 'profile.html')

def logout_view(request):
    logout(request)
    return redirect('login')

@login_required  # Декоратор для защиты страницы, чтобы доступ был только у авторизованных пользователей
def lk_view(request):
    # Здесь можно добавить логику для передачи данных в шаблон
    return render(request, 'lk.html', {'user': request.user})