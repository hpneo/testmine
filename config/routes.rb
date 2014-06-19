scope '/projects/:project_id' do
  resources :test_suites
  resources :test_cases do
    member do
      post :delete_test_case_step
      get :move
    end
  end
  resources :test_suite_test_cases
  resources :test_plans do
    member do
      get :add_test_case
    end
  end
  resources :test_executions
end

get '/projects/:project_id/test', :to => 'testmine#index', as: 'testmine_index'
get '/projects/:project_id/test/test_execution/:test_execution_id', :to => 'testmine#test_execution', as: 'testmine_test_execution'
get '/projects/:project_id/test/test_plan/:test_plan_id', :to => 'testmine#test_plan', as: 'testmine_test_plan'
get '/projects/:project_id/test/edit_test_plan/:test_plan_id', :to => 'testmine#edit_test_plan', as: 'testmine_edit_test_plan'

# get '/projects/:project_id/test_suites', :to => 'test_suites#index', as: 'test_suites'
# get '/projects/:project_id/test_suites/new', :to => 'test_suites#new', as: 'new_test_suite'
# post '/projects/:project_id/test_suites', :to => 'test_suites#create', as: 'test_suites'

# get '/projects/:project_id/test_suites/:test_suite_id/test_cases', :to => 'test_cases#index', as: 'test_cases'
# get '/projects/:project_id/test_suites/:test_suite_id/test_cases/new', :to => 'test_cases#new', as: 'new_test_case'
# post '/projects/:project_id/test_suites/:test_suite_id/test_cases', :to => 'test_cases#create', as: 'test_cases'