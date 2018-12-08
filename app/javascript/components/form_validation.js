// only use this in an iterator, not individually
const capitalize = word => word[0].toUpperCase() + word.substr(1).toLowerCase();

const hasError = (group) => {
  const groupClass = group.classList;
  groupClass.add("has-error");
  groupClass.remove("has-success");
};
const hasSuccess = (group, label, controlLabel) => {
  const groupClass = group.classList;
  groupClass.remove("has-error");
  groupClass.add("has-success");
  controlLabel.innerText = label;
};
const enableSubmit = (group, checkbox, button) => {
  if ((group.classList.contains("has-success")) && (checkbox.checked)) {
    button.disabled = false;
    button.innerText = "Become a Host!";
  } else {
    button.disabled = true;
    button.innerText = "Please fill fields correctly";
  }
};

const blurEvent = (event) => {
  const checkbox = document.getElementById("tos");
  const button = document.querySelector(".submit");

  const control = event.target;
  const group = control.parentElement;
  const label = capitalize(control.id.replace("office_", ""));
  const controlLabel = group.querySelector(".control-label");
  if (control.value === "" && control.id != "office_description") {
    hasError(group);
    controlLabel.innerText = `${label}: Required field!`;
  } else if (control.id != "office_description") {
    hasSuccess(group, label, controlLabel);
  }
  enableSubmit(group, checkbox, button);
};
const clickEvent = (event) => {
  const form = document.querySelector(".office-form");
  const formGroups = form.querySelectorAll(".form-group");
  const checkbox = document.getElementById("tos");
  const button = form.querySelector(".btn");

  formGroups.forEach((group) => {
    enableSubmit(group, checkbox, button);
  });
};

const addBlurControl = (group) => { group.lastElementChild.addEventListener("blur", blurEvent); };

const initValidate = (form) => {
  const formGroups = form.querySelectorAll(".form-group");
  const checkbox = document.getElementById("tos");
  formGroups.forEach(addBlurControl);
  checkbox.addEventListener("click", clickEvent);
};

export { initValidate };
