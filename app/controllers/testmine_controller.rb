class TestmineController < ApplicationController
  unloadable

  before_filter :find_project
  before_filter :authorize, except: [ :test_execution, :test_plan, :edit_test_plan ]

  def index
    @test_suite = TestSuite.new(project_id: @project.id)
    @test_plan = TestPlan.new(project_id: @project.id)
    @test_execution = TestExecution.new
    @test_execution.test_case = TestCase.new
  end

  def test_plan
    @test_plan = TestPlan.find(params[:test_plan_id])

    render partial: 'testmine/test_plan', locals: { test_plan: @test_plan }
  end

  def edit_test_plan
    @test_plan = TestPlan.find(params[:test_plan_id])

    render partial: 'testmine/test_plan_form', locals: { test_plan: @test_plan }
  end

  def test_execution
    @test_execution = TestExecution.find(params[:test_execution_id])

    render partial: 'test_executions/form', locals: { test_execution: @test_execution }
  end

  private
  def find_project
    identifier = params[:project_id]

    @project = Project.find(identifier)
  end
end