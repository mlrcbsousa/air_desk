import "bootstrap";
import { initDatepickers } from '../components/datepicker';
import { initChart } from '../components/chart';
import { initType } from '../components/typed';
import { initValidate } from '../components/form_validation';

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

const newOffice = document.getElementById("new_office");
const editOffice = document.querySelector(".office-form");
if (newOffice) {
  initValidate(newOffice);
} else if (editOffice) {
  initValidate(editOffice);
};

