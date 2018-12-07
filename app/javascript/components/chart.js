const initChart = function () {

var ctx = document.getElementById('myChart').getContext('2d');
var chart = new Chart(ctx, {
    // The type of chart we want to create
    type: 'bar',

    // The data for our dataset
    data: {
        labels: ["Feb", "March", "April", "May", "June", "July", "Aug", "Sept", "Oct", "Nov", "MTD"],
        datasets: [{
            label: "Bookings by month",
            backgroundColor: '#46CEE0',
            borderColor: 'rgb(255, 255, 255)',
            data: [10, 5, 2, 20, 30, 25, 54, 5, 34, 49, 20],
        }]
    },

    // Configuration options go here
    options: {}
});
};


export { initChart };
