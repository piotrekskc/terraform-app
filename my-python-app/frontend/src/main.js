const fetchData = async () => {
    try {
        const response = await fetch('http://localhost:5000/data'); // Zmienna URL powinna odpowiadać endpointowi w backendzie
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        const data = await response.json();
        displayData(data);
    } catch (error) {
        console.error('There has been a problem with your fetch operation:', error);
    }
};

const displayData = (data) => {
    const dataContainer = document.getElementById('data-container');
    dataContainer.innerHTML = JSON.stringify(data, null, 2); // Wyświetlanie danych w formacie JSON
};

document.addEventListener('DOMContentLoaded', () => {
    fetchData();
});