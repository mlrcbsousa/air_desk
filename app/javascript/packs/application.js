import "bootstrap";
import { initDatepickers } from '../components/datepicker';
import { initChart } from '../components/chart';

const dayRate = document.getElementById("dayrate");
  if (dayRate) {
    initDatepickers();
};

const showChart = document.getElementById("myChart");
  if (showChart) {
    initChart();
};
