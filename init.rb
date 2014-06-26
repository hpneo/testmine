ActionDispatch::Callbacks.to_prepare do
  require_dependency 'testmine/project_patch'
end

Redmine::Plugin.register :testmine do
  name 'Testmine plugin'
  author 'Gustavo Leon'
  description 'Tests manager plugin for Redmine'
  version '0.0.1'
  url 'http://github.com/hpneo/testmine'
  author_url 'http://hpneo.github.io'

  permission :testmine,
    {
      :testmine => [:index]
      #:test_suites => [:index, :show, :new, :edit, :create, :update, :destroy],
      #:test_cases => [:index, :show, :new, :edit, :create, :update, :destroy],
      #:test_plans => [:index, :show, :new, :edit, :create, :update, :destroy],
      #:test_executions => [:index, :show, :new, :edit, :create, :update, :destroy]
    },
    :public => true

  permission :create_test_suite, :test_suites => [ :new, :create ]
  permission :view_test_suite, :test_suites => [ :index, :show ]
  permission :edit_test_suite, :test_suites => [ :edit, :update ]
  permission :delete_test_suite, :test_suites => [ :destroy ]

  permission :create_test_case, :test_cases => [ :new, :create ]
  permission :view_test_case, :test_cases => [ :index, :show ]
  permission :edit_test_case, :test_cases => [ :edit, :update ]
  permission :move_test_case, :test_cases => [ :move ]
  permission :delete_test_case, :test_cases => [ :destroy ]

  permission :create_test_plan, :test_plans => [ :new, :create ]
  permission :view_test_plan, :test_plans => [ :index, :show ]
  permission :edit_test_plan, :test_plans => [ :edit, :update ]
  permission :add_test_case, { :test_plans => [ :add_test_case ], :test_executions => [ :create ] }
  permission :delete_test_plan, :test_plans => [ :destroy ]

  permission :load_test_plan, :test_plans => [ :show ]
  permission :create_bug, :issues => [ :new, :create ]
  permission :execute_test_case, :test_executions => [ :update ]
  permission :save_test_plan, :test_plans => [ :update ]

  menu :project_menu,
    :testmine,
    {
      :controller => 'testmine',
      :action => 'index'
    },
    :caption => 'Test',
    :last => true,
    :param => :project_id
end
