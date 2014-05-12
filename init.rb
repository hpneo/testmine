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
      :test_suites => [:index, :new, :create],
      :test_cases => [:index, :new, :create]
    },
    :public => true

  menu :project_menu,
    :test_suites,
    {
      :controller => 'test_suites',
      :action => 'index'
    },
    :caption => 'Test',
    :last => true,
    :param => :project_id
end
