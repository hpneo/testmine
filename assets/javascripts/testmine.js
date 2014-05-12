$(function() {
  $(document).on('click', '.show-new-test-suite', function(e) {
    e.preventDefault();

    window.currentModal = Modal.show('new-test-suite');
  });

  $(document).on('click', '.show-new-test-case', function(e) {
    e.preventDefault();

    var xhr = $.get($(this).attr('href'), { use_layout: false });

    xhr.done(function(data) {
      $('#new-test-case-modal-content').html(data);
      window.currentModal = Modal.show('new-test-case');
    });
  });
});