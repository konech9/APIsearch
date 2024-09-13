document.addEventListener('DOMContentLoaded', () => {
    const searchBox = document.getElementById('search-box');
    const priceFilter = document.getElementById('price-filter');
    const typeFilter = document.getElementById('type-filter');
    const popularityFilter = document.getElementById('popularity-filter');
    const protocolFilter = document.getElementById('protocol-filter');
    const dateFilter = document.getElementById('date-filter');
    const apiList = document.getElementById('api-list');
    const apiItems = Array.from(apiList.getElementsByClassName('api-item'));

    function filterAndSort() {
        const searchTerm = searchBox.value.toLowerCase();
        const priceValue = priceFilter.value;
        const typeValue = typeFilter.value;
        const popularityValue = popularityFilter.value;
        const protocolValue = protocolFilter.value;
        const dateValue = dateFilter.value;

        // Фильтрация элементов
        let filteredItems = apiItems.filter(item => {
            const name = item.dataset.name.toLowerCase();
            const price = parseFloat(item.dataset.price);
            const type = item.dataset.type;
            const popularity = item.dataset.popularity;
            const protocol = item.dataset.protocol;
            const date = new Date(item.dataset.date);

            let showItem = true;

            if (searchTerm && !name.includes(searchTerm)) {
                showItem = false;
            }

            if (typeValue && type !== typeValue) {
                showItem = false;
            }

            if (popularityValue && popularity !== popularityValue) {
                showItem = false;
            }

            if (protocolValue && protocol !== protocolValue) {
                showItem = false;
            }

            if (priceValue && (priceValue === 'low-high' && price > parseFloat(priceFilter.getAttribute('data-min-price')) || priceValue === 'high-low' && price < parseFloat(priceFilter.getAttribute('data-max-price')))) {
                showItem = false;
            }

            return showItem;
        });

        // Сортировка элементов
        if (priceFilter.value === 'price-low-high') {
            filteredItems.sort((a, b) => parseFloat(a.dataset.price) - parseFloat(b.dataset.price));
        } else if (priceFilter.value === 'price-high-low') {
            filteredItems.sort((a, b) => parseFloat(b.dataset.price) - parseFloat(a.dataset.price));
        } else if (dateFilter.value === 'newest') {
            filteredItems.sort((a, b) => new Date(b.dataset.date) - new Date(a.dataset.date));
        } else if (dateFilter.value === 'oldest') {
            filteredItems.sort((a, b) => new Date(a.dataset.date) - new Date(b.dataset.date));
        }

        // Обновление отображения элементов
        apiList.innerHTML = ''; // Очистить текущий список
        filteredItems.forEach(item => apiList.appendChild(item));
    }

    searchBox.addEventListener('input', filterAndSort);
    priceFilter.addEventListener('change', filterAndSort);
    typeFilter.addEventListener('change', filterAndSort);
    popularityFilter.addEventListener('change', filterAndSort);
    protocolFilter.addEventListener('change', filterAndSort);
    dateFilter.addEventListener('change', filterAndSort);

    filterAndSort(); // Изначальный вызов для отображения элементов на основе значений по умолчанию
});
