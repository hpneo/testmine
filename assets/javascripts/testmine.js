$(function() {
  $(document).on('click', '.show_menu', function(e) {
    e.preventDefault();

    var menu = $(this).parents('h4').find('ul');
    $('ul.menu:visible').not(menu[0]).slideUp();
    menu.slideToggle();
  });

  $(document).on('click', '.test_suite_test_cases h5', function(e) {
    e.preventDefault();

    var menu = $(this).siblings('ul');
    $('ul.menu:visible').not(menu[0]).slideUp();
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

    if (permissions.indexOf('create_test_suite') != -1) {
      window.currentModal = Modal.show('new-test-suite');
    }
    else {
      alert("You don't have permissions to perform this action");
    }
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

  $(document).on('click', '.show-test-plan', function(e) {
    e.preventDefault();

    var xhr = $.get($(this).attr('href'), { use_layout: false });

    xhr.done(function(data) {
      $('#show-test-plan-modal-content').html(data);
      window.currentModal = Modal.show('show-test-plan');
    });
  });

  $(document).on('click', '.show-new-test-plan', function(e) {
    e.preventDefault();

    if (permissions.indexOf('create_test_plan') != -1) {
      window.currentModal = Modal.show('new-test-plan');
    }
    else {
      alert("You don't have permissions to perform this action");
    }
  });

  $(document).on('click', '.show-edit-test-plan', function(e) {
    e.preventDefault();

    var xhr = $.get($(this).attr('href'), { use_layout: false });

    xhr.done(function(data) {
      $('#edit-test-plan-modal-content').html(data);
      window.currentModal = Modal.show('edit-test-plan');
    });
  });

  $(document).on('click', '.show-add-test-case', function(e) {
    e.preventDefault();

    var xhr = $.get($(this).attr('href'), { use_layout: false });
    xhr.done(function(data) {
      $('#add-test-case-modal-content').html(data);
      window.currentModal = Modal.show('add-test-case');
    });
  });

  $(document).on('click', '#load_test_plan', function(e) {
    e.preventDefault();

    var testPlanId = $('#load_test_plan_id').val();

    if (testPlanId === "") {
      return false;
    }

    $.get('test/test_plan/' + testPlanId).done(function(html) {
      $('#test_plan_content').html(html);
    });

    $.get('test/edit_test_plan/' + testPlanId).done(function(html) {
      $('#test_plan_loader').find('form').replaceWith(html);
    });
  });

  $(document).on('click', '#test_plan_test_executions a', function(e) {
    e.preventDefault();

    var xhr = $.get($(this).attr('href'));

    xhr.done(function(html) {
      $('#test_execution_form').find('form').replaceWith(html);
    });
  });

  $(document).on('click', '#new_issue', function(e) {
    e.preventDefault();

    var xhr = $.get('issues/new', {
      'issue[subject]': ''
    });

    xhr.done(function(html) {
      window.currentModal = new Modal({
        template: html
      }).show();
    })
  });

  $(document).on('submit', '#issue-form', function(e) {
    e.preventDefault();

    var url = $(this).attr('action');
    var formData = new FormData($(this)[0]);

    var issueXhr = $.ajax({
      url: url + '.json',
      processData: false,
      contentType: false,
      dataType: 'json',
      data: formData,
      type: 'POST'
    });

    issueXhr.done(function(response) {
      var xhr = $.ajax({
        url: 'test_execution_issues',
        dataType: 'json',
        data: {
          test_execution_issue: {
            issue_id: response.issue.id,
            test_execution_id: $('input#new_issue').data('id')
          }
        },
        type: 'POST'
      });

      return xhr;
    }).done(function(response) {
      //response.test_execution_issue
      window.currentModal.close();
    });
  });

  $(document).on('ajax:beforeSend', '.modal .new_test_plan, .modal .edit_test_plan', function(e) {
    var startOn = {
      year: $(this).find('#test_plan_start_on_1i').val(),
      month: $(this).find('#test_plan_start_on_2i').val() - 1,
      day: $(this).find('#test_plan_start_on_3i').val(),
      hour: $(this).find('#test_plan_start_on_4i').val(),
      minute: $(this).find('#test_plan_start_on_5i').val()
    };

    var finishOn = {
      year: $(this).find('#test_plan_finish_on_1i').val(),
      month: $(this).find('#test_plan_finish_on_2i').val() - 1,
      day: $(this).find('#test_plan_finish_on_3i').val(),
      hour: $(this).find('#test_plan_finish_on_4i').val(),
      minute: $(this).find('#test_plan_finish_on_5i').val()
    };

    var isValid = new Date(finishOn.year, finishOn.month, finishOn.day, finishOn.hour, finishOn.minute) > new Date(startOn.year, startOn.month, startOn.day, startOn.hour, startOn.minute);

    return isValid;
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

  $(document).ajaxError(function(e, xhr, settings, errorName){
    if (xhr.status === 403) {
      alert("You don't have permissions to perform this action");
    }
  });

  $('.test_suite_test_cases').children('li').draggable({
    revert: 'invalid'
  });

  $('.test_suite_test_cases').droppable({
    activeClass: 'ui-state-default',
    drop: function(e, ui) {
      var testCaseId = ui.draggable.attr('id').replace('test_case_', ''),
          testSuiteId = ui.draggable.parents('li').first().attr('id').replace('test_suite_', ''),
          self = $(this),
          newTestSuiteId = self.parents('li').first().attr('id').replace('test_suite_', '');

      $.getJSON('test_cases/' + testCaseId + '/move?test_suite_id=' + testSuiteId).then(function(data) {
        $.ajax({
          type: 'POST',
          url: 'test_suite_test_cases/' + data.test_suite_test_case.id,
          dataType: 'script',
          data: {
            _method: 'put',
            test_suite_test_case: {
              test_suite_id: newTestSuiteId
            },
            previous_test_suite_id: testSuiteId
          }
        });
      });
    }
  });
});