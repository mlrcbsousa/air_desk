import flatpickr from 'flatpickr';
import "flatpickr/dist/flatpickr.css";

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
    }
  });
    const endDateCalendar =
      flatpickr(endDateinput, {
        dateFormat: 'd-m-Y',
      });
  }
};

export { initDatepickers };

