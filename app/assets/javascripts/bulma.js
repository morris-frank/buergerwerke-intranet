domready(function () {
  // Burger Menu
  var burgers = document.getAll('.navbar-burger');

  if (burgers.length > 0) setBurgerListeners();

  function setBurgerListeners () {
    burgers.forEach(function (burger) {
      burger.addEventListener('click', function () {
        this.classList.toggle('is-active');
        var target = document.getElementById(this.dataset.target);
        target.classList.toggle('is-active');
      });
    });
  }

  // Modals
  var modals = document.getAll('.modal');
  var modalButtons = document.getAll('.modal-button');
  var modalClosers = document.getAll('.modal-background, .modal-close');

  if (modalButtons.length > 0 && modalClosers.length > 0) {
    setModalButtonListeners();
    setModalCloserListeners();
  }

  function setModalButtonListeners() {
    modalButtons.forEach(function (modalButton) {
      modalButton.addEventListener('click', function () {
        var modal = document.getElementById(this.dataset.target);
        document.documentElement.classList.add('is-clipped');
        modal.classList.add('is-active');
      });
    });
  }

  function setModalCloserListeners () {
    modalClosers.forEach(function (modalCloser) {
      modalCloser.addEventListener('click', function () {
        document.documentElement.classList.remove('is-clipped');
        modals.forEach(function (modal) {
          modal.classList.remove('is-active');
        });
      });
    });
  }


  // Sticky Table Headers
//   var stickyTables = document.getAll('.is-sticky');

//   if (stickyTables.length > 0) stickStickyTables();

//   function stickStickyTables() {
//     window.addEventListener("scroll", function () {
//       stickyTables.forEach(function (stickyTable) {
//         var bounds = stickyTable.getBoundingClientRect();
//         var topTrans = - Math.min(bounds.top, 0);
//         var translate = "translate(0," + topTrans + "px)";
//         stickyTable.querySelector("thead").style.transform = translate;
//        });
//     });
//   }
});
