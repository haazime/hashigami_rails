var setupInlineEdit = function() {
  var toggleInlineEdit = function (e) {
    e.preventDefault();

    var targetId = this.dataset.inlineEditTarget;
    var target = document.getElementById(targetId);
    target.classList.toggle('ie-Section-open');
  };

  var toggles = document.querySelectorAll('[data-behavior="toggle-inline-edit"]');
  for(var i = 0; i < toggles.length; i++) {
    var toggle = toggles[i];
    toggle.addEventListener('click', toggleInlineEdit, false);
  }
}
