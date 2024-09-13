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

        apiItems.forEach(item => {
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

            item.style.display = showItem ? 'block' : 'none';
        });

        sortItems();
    }

    function sortItems() {
        const sortBy = {
            'price-low-high': (a, b) => parseFloat(a.dataset.price) - parseFloat(b.dataset.price),
            'price-high-low': (a, b) => parseFloat(b.dataset.price) - parseFloat(a.dataset.price),
            'newest': (a, b) => new Date(b.dataset.date) - new Date(a.dataset.date),
            'oldest': (a, b) => new Date(a.dataset.date) - new Date(b.dataset.date)
        };

        const sortValue = {
            'price-filter': priceFilter.value,
            'date-filter': dateFilter.value
        };

        apiItems.sort((a, b) => {
            for (const [key, value] of Object.entries(sortValue)) {
                if (sortBy[value]) {
                    return sortBy[value](a, b);
                }
            }
            return 0;
        });

        apiItems.forEach(item => apiList.appendChild(item));
    }

    searchBox.addEventListener('input', filterAndSort);
    priceFilter.addEventListener('change', filterAndSort);
    typeFilter.addEventListener('change', filterAndSort);
    popularityFilter.addEventListener('change', filterAndSort);
    protocolFilter.addEventListener('change', filterAndSort);
    dateFilter.addEventListener('change', filterAndSort);

    filterAndSort(); // Initial call to display items based on the default values
});
