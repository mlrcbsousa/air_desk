import "bootstrap";
import { initDatepickers } from '../components/datepicker';
import { initChart } from '../components/chart';
import { initType } from '../components/typed';

const dayRate = document.getElementById("dayrate");
  if (dayRate) {
    initDatepickers();
};

const showChart = document.getElementById("myChart");
  if (showChart) {
    initChart();
};

const showType = document.getElementById("typed");
  if (showType) {
    initType();
};
