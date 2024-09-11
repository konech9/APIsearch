from django.shortcuts import render
from .models import API

def api_list(request):
    # Фильтры
    category = request.GET.get('category')
    apis = API.objects.all()

    if category:
        apis = apis.filter(category=category)

    context = {
        'apis': apis,
    }
    return render(request, 'main/api_list.html', context)