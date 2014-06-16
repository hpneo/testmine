$(function() {
  $(document).on('click', '.show_menu', function(e) {
    e.preventDefault();

    var menu = $(this).parents('h4').find('ul');
    menu.slideToggle();
  });
  $(document).on('click', '.test_suite_test_cases h5', function(e) {
    e.preventDefault();

    var menu = $(this).siblings('ul');
    menu.slideToggle();
  });

  $(document).on('click', '.show-test-suite', function(e) {
    e.preventDefault();

    var xhr = $.get($(this).attr('href'), { use_layout: false });

    xhr.done(function(data) {
      $('#show-test-suite-modal-content').html(data);
      window.currentModal = Modal.show('show-test-suite');
    });
  });

  $(document).on('click', '.show-new-test-suite', function(e) {
    e.preventDefault();

    window.currentModal = Modal.show('new-test-suite');
  });

  $(document).on('click', '.show-edit-test-suite', function(e) {
    e.preventDefault();

    var xhr = $.get($(this).attr('href'), { use_layout: false });

    xhr.done(function(data) {
      $('#edit-test-suite-modal-content').html(data);
      window.currentModal = Modal.show('edit-test-suite');
    });
  });

  $(document).on('click', '.show-new-test-case', function(e) {
    e.preventDefault();

    var xhr = $.get($(this).attr('href'), { use_layout: false });

    xhr.done(function(data) {
      $('#new-test-case-modal-content').html(data);
      window.currentModal = Modal.show('new-test-case');
    });
  });

  $(document).on('click', '.show-test-case', function(e) {
    e.preventDefault();

    var xhr = $.get($(this).attr('href'), { use_layout: false });

    xhr.done(function(data) {
      $('#show-test-case-modal-content').html(data);
      window.currentModal = Modal.show('show-test-case');
    });
  });

  $(document).on('click', '.show-move-test-case', function(e) {
    e.preventDefault();

    var xhr = $.get($(this).attr('href'), { use_layout: false });

    xhr.done(function(data) {
      $('#move-test-case-modal-content').html(data);
      window.currentModal = Modal.show('move-test-case');
    });
  });

  $(document).on('click', '.show-edit-test-case', function(e) {
    e.preventDefault();

    var xhr = $.get($(this).attr('href'), { use_layout: false });

    xhr.done(function(data) {
      $('#edit-test-case-modal-content').html(data);
      window.currentModal = Modal.show('edit-test-case');
    });
  });

  $(document).on('click', '.add_test_case_step', function(e) {
    e.preventDefault();

    var testCaseSteps = $('#test_case_steps'),
        index = testCaseSteps.find('.test_case_step').length;

    testCaseSteps.append('<div class="test_case_step">' + 
      '  <label for="test_case[test_case_steps_attributes][' + index + ']_item"></label><input class="test_case_step_item" id="test_case_test_case_steps_attributes_' + index + '_item" name="test_case[test_case_steps_attributes][' + index + '][item]" type="number" value="' + (index + 1) + '" />' + 
      '  <label for="test_case[test_case_steps_attributes][' + index + ']_action"></label><input class="test_case_step_action" id="test_case_test_case_steps_attributes_' + index + '_action" name="test_case[test_case_steps_attributes][' + index + '][action]" size="3' + index + '" type="text" />' + 
      '  <label for="test_case[test_case_steps_attributes][' + index + ']_expected_result"></label><input class="test_case_step_expected_result" id="test_case_test_case_steps_attributes_' + index + '_expected_result" name="test_case[test_case_steps_attributes][' + index + '][expected_result]" size="30" type="text" />' + 
      '  <a href="#" class="remove_test_case_step"><img alt="Remove" src="/plugin_assets/testmine/images/remove.png?1400045123" width="16"></a>' + 
    '  </div>');
  });

  $(document).on('click', '.remove_test_case_step', function(e) {
    e.preventDefault();

    var testCaseStep = $(this).parents('.test_case_step');

    if (testCaseStep.attr('id') === undefined) {
      testCaseStep.remove();
    }
    else {
      var id = testCaseStep.attr('id').replace('test_case_step_', '');

      if (testCaseStepsURLS[id] !== undefined) {
        $.ajax({
          url: testCaseStepsURLS[id],
          type: 'POST',
          dataType: 'script'
        });
      }
    }
  });

  $(document).on('click', '.tabs a', function(e) {
    e.preventDefault();

    var self = $(this),
        tabs = self.parents('.tabs'),
        tabPages = tabs.siblings('.tab_pages');

    var tabPageId = self.attr('href').split('#')[1],
        tabPage = tabPages.find('#' + tabPageId);

    var otherTabs = tabs.find('a'),
        otherTabPages = tabPages.find('.tab_page');

    otherTabs.removeClass('selected');
    self.addClass('selected');

    otherTabPages.removeClass('selected');
    tabPage.addClass('selected');

    // if (history.pushState) {
    //   history.pushState(null, null, '#' + tabPageId.replace('tab_', ''));
    // }
    // else {
    //   location.hash = tabPageId.replace('tab_', '');
    // }
  });

  var currentTab = location.hash.replace('#', '');

  if (location.hash === '') {
    var currentTab = 'planification';
  }

  $('.tabs').find('a[href="#tab_' + currentTab + '"]').click();
});