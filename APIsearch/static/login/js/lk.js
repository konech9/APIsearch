document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('analytics').addEventListener('click', function() {
        fetch('/api/usage-data/')
            .then(response => response.json())
            .then(data => {
                const ctx = document.getElementById('apiChart').getContext('2d');
                new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: data.labels,
                        datasets: [{
                            label: 'Количество использований',
                            data: data.counts,
                            backgroundColor: 'rgba(75, 192, 192, 0.2)',
                            borderColor: 'rgba(75, 192, 192, 1)',
                            borderWidth: 1
                        }]
                    },
                    options: {
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                });
            })
            .catch(error => console.error('Error fetching usage data:', error));
    });
});
