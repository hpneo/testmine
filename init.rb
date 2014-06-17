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
      :testmine => [:index],
      :test_suites => [:index, :show, :new, :edit, :create, :update, :destroy],
      :test_cases => [:index, :show, :new, :edit, :create, :update, :destroy],
      :test_plans => [:index, :show, :new, :edit, :create, :update, :destroy]
    },
    :public => true

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
