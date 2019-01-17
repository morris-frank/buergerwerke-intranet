function setBurgerListeners(burgers) {
  burgers.forEach(function (burger) {
    burger.addEventListener('click', function () {
      this.classList.toggle('is-active');
      var target = document.getElementById(this.dataset.target);
      target.classList.toggle('is-active');
    });
  });
}

function setModalButtonListeners(modalButtons) {
  modalButtons.forEach(function (modalButton) {
    modalButton.addEventListener('click', function () {
      var modal = document.getElementById(this.dataset.target);
      document.documentElement.classList.add('is-clipped');
      modal.classList.add('is-active');
    });
  });
}

function setModalCloserListeners(modalClosers) {
  var modals = document.getAll('.modal');
  modalClosers.forEach(function (modalCloser) {
    modalCloser.addEventListener('click', function () {
      document.documentElement.classList.remove('is-clipped');
      modals.forEach(function (modal) {
        modal.classList.remove('is-active');
      });
    });
  });
}

document.addEventListener("turbolinks:load", function() {
// domready(function () {
  var burgers = document.getAll('.navbar-burger');
  if (burgers.length > 0) setBurgerListeners(burgers);

  var modalButtons = document.getAll('.modal-button');
  var modalClosers = document.getAll('.modal-background, .modal-close');
  if (modalButtons.length > 0 && modalClosers.length > 0) {
    setModalButtonListeners(modalButtons);
    setModalCloserListeners(modalClosers);
  }
// });
});
