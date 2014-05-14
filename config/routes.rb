get '/projects/:project_id/test', :to => 'test_suites#index', as: 'test_suites'
get '/projects/:project_id/test_suites/new', :to => 'test_suites#new', as: 'new_test_suite'
post '/projects/:project_id/test_suites', :to => 'test_suites#create', as: 'test_suites'

get '/projects/:project_id/test_suites/:test_suite_id/test_cases', :to => 'test_cases#index', as: 'test_cases'
get '/projects/:project_id/test_suites/:test_suite_id/test_cases/new', :to => 'test_cases#new', as: 'new_test_case'
post '/projects/:project_id/test_suites/:test_suite_id/test_cases', :to => 'test_cases#create', as: 'test_cases'