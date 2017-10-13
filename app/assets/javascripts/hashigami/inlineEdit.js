var setupInlineEdit = function() {
  var toggleInlineEdit = function (e) {
    e.preventDefault();

    var targetId = this.dataset.inlineEditTarget;
    var target = document.getElementById(targetId);
    target.classList.toggle('hashigami-InlineEdit-open');
  };

  var toggles = document.querySelectorAll('[data-behavior="hashigami-inline-edit"]');
  for(var i = 0; i < toggles.length; i++) {
    var toggle = toggles[i];
    toggle.addEventListener('click', toggleInlineEdit, false);
  }
}
