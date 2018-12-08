import flatpickr from 'flatpickr';
import "flatpickr/dist/flatpickr.css";

const parseDate = (string) => {
  const pattern = /(\d{2})-(\d{2})-(\d{4})/;
  return new Date(string.replace(pattern,'$3-$2-$1'));
}

const updatePrice = (startDate, endDate) => {
  const dayrate = parseInt(document.getElementById("dayrate").innerText, 10);
  const totalPrice = document.getElementById("total-price")
  const a = parseDate(startDate);
  const b = parseDate(endDate);
  const calculatedPrice = ((b - a) / 86400000) * dayrate;
  totalPrice.innerText = calculatedPrice + " €";
};

const initDatepickers = function () {
  const startDateinput = document.getElementById('booking_start_date');
  const endDateinput = document.getElementById('booking_end_date');

  if (startDateinput && endDateinput) {
    flatpickr(startDateinput, {
    minDate: 'today',
    dateFormat: 'd-m-Y',
    onChange: function(selectedDates, selectedDate) {
      if (selectedDate === '') {
        return endDateinput.disabled = true;
      }
      endDateCalendar.set('minDate', selectedDate);
      endDateCalendar.setDate(selectedDates[0].fp_incr(7));
      endDateinput.disabled = false;
      updatePrice(startDateinput.value, endDateinput.value);
    }
  });

  const endDateCalendar =
    flatpickr(endDateinput, {
      dateFormat: 'd-m-Y',
      onChange: function(_, selectedDate) {
        updatePrice(startDateinput.value, endDateinput.value);
      }
    });
  }
};

export { initDatepickers };
