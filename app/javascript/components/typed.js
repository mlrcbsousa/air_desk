import Typed from 'typed.js';

const initType = function () {
  var options = {
    typeSpeed: 100,
    stringsElement: '#footer-copyright',
    loop: true,
    showCursor: false
  }

  var typed = new Typed("#typed", options, {

  });
};

export { initType };
