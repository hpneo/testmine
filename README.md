# Redmine plugin

## Models

`RAILS_ENV=production ruby script/rails generate redmine_plugin_model Testmine TestCaseStatus name:string description:text`
`RAILS_ENV=production ruby script/rails generate redmine_plugin_model Testmine TestCaseExecutionType name:string description:text`
`RAILS_ENV=production ruby script/rails generate redmine_plugin_model Testmine TestCaseImportance name:string description:text`

`RAILS_ENV=production ruby script/rails generate redmine_plugin_model Testmine TestSuite name:string summary:text project:references`
`RAILS_ENV=production ruby script/rails generate redmine_plugin_model Testmine TestCase title:string summary:text preconditions:text duration:integer test_case_status:references test_case_execution_type:references test_case_importance:references document:references`
`RAILS_ENV=production ruby script/rails generate redmine_plugin_model Testmine TestSuiteTestCase test_suite:references test_case:references`
`RAILS_ENV=production ruby script/rails generate redmine_plugin_model Testmine TestCaseStep item:integer action:string expected_result:string test_case:references`

`RAILS_ENV=production ruby script/rails generate redmine_plugin_model Testmine TestExecutionStatus name:string description:text`
`RAILS_ENV=production ruby script/rails generate redmine_plugin_model Testmine TestExecution duration:integer executed_on:datetime comment:text executed_by_user_id:integer test_execution_status:references`

`RAILS_ENV=production ruby script/rails generate redmine_plugin_model Testmine TestPlanStatus name:string description:text`
`RAILS_ENV=production ruby script/rails generate redmine_plugin_model Testmine TestPlan title:string summary:text start_on:datetime finish_on:datetime created_by_user_id:integer executed_by_user_id:integer test_plan_status:references`

## Install models

`RAILS_ENV=production rake redmine:plugins:migrate`

## Structure

```
Project
  Test Suite
    Test Case
  Test Plan
    Test Run (Execution)
      Test Result (Report)
```

## Features

* Drag-n-drop para cambiar cases entre suites
* Agregar steps dinámicamente