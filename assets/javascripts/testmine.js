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

  $(document).on('click', '.add_test_case_step', function(e) {
    e.preventDefault();

    var test_case_steps = $('#test_case_steps');

    var index = test_case_steps.find('.test_case_step').length;

    test_case_steps.append('<div class="test_case_step">' + 
      '  <label for="test_case[test_case_steps_attributes][' + index + ']_step_order"></label><input class="test_case_step_step_order" id="test_case_test_case_steps_attributes_' + index + '_step_order" name="test_case[test_case_steps_attributes][' + index + '][step_order]" type="number" value="' + (index + 1) + '" />' + 
      '  <label for="test_case[test_case_steps_attributes][' + index + ']_action"></label><input class="test_case_step_action" id="test_case_test_case_steps_attributes_' + index + '_action" name="test_case[test_case_steps_attributes][' + index + '][action]" size="3' + index + '" type="text" />' + 
      '  <label for="test_case[test_case_steps_attributes][' + index + ']_results"></label><input class="test_case_step_results" id="test_case_test_case_steps_attributes_' + index + '_results" name="test_case[test_case_steps_attributes][' + index + '][results]" size="30" type="text" />' + 
      '    <a href="#" class="remove_test_case_step"><img alt="Remove" src="/plugin_assets/testmine/images/remove.png?1400045123" width="16"></a>' + 
    '  </div>');
  });

  $(document).on('click', '.remove_test_case_step', function(e) {
    e.preventDefault();

    var test_case_step = $(this).parents('.test_case_step');

    if (test_case_step.attr('id') === undefined) {
      test_case_step.remove();
    }
  });
});