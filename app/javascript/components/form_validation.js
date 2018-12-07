// only use this in an iterator, not individually
const initValidate = function () {

  const newOffice = document.getElementById("new_office");
  const editOffice = document.getElementById("edit_office");
  if (newOffice)  {
    const form = newOffice;
  } else if (editOffice) {
    const form = editOffice;
  };

  const formGroups = document.querySelectorAll(".form-group");
  const formControls = document.querySelectorAll(".form-control");
  const checkbox = document.getElementById("tos");
  const button = document.querySelector(".btn");

  const capitalize = word => word[0].toUpperCase() + word.substr(1).toLowerCase();

  const enableSubmit = (group) => {
    if ((group.classList.contains("has-success")) && (checkbox.checked)) {
      button.disabled = false;
      button.innerText = "Become a Host!";
    } else {
      button.disabled = true;
      button.innerText = "Please fill fields correctly";
    }
  };
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

  const blurEvent = (event) => {
    const control = event.target;
    const group = control.parentElement;
    const label = capitalize(control.id).replace("_", " ");
    const controlLabel = group.querySelector(".control-label");
    if (control.value === "") {
      hasError(group);
      controlLabel.innerText = `${label}: This field is required!`;
    } else {
      hasSuccess(group, label, controlLabel);
    }
    enableSubmit(group);
  };
  const clickEvent = (event) => { formGroups.forEach(enableSubmit); };
  const addBlurControl = (group) => { group.lastElementChild.addEventListener("blur", blurEvent); };

  formGroups.forEach(addBlurControl);
  checkbox.addEventListener("click", clickEvent);

};

export { initValidate };
