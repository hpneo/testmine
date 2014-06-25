class TestExecutionsController < ApplicationController
  unloadable

  before_filter :find_project
  before_filter :authorize

  after_filter :set_executed_by, on: [ :update ]

  def create
    @test_execution = TestExecution.new
    @test_execution.test_plan_id = params[:test_execution][:test_plan_id]
    @test_execution.test_case_id = params[:test_execution][:test_case_id]
    @test_case = TestCase.find(params[:test_execution][:test_case_id])
    @test_plan ||= TestPlan.find(params[:test_execution][:test_plan_id])

    if @test_execution.save
      render 'create.js'
    end
  end

  def update
    @test_execution = TestExecution.find(params[:id])

    if @test_execution.update_attributes(params[:test_execution])
      render 'update.js'
    end
  end

  private
  def find_project
    identifier = params[:project_id]

    @project = Project.find(identifier)
  end

  def set_executed_by
    if @test_execution && @test_execution.test_plan
      @test_execution.executed_by = User.current if @test_execution.test_plan.finished?
      @test_execution.save
    end
  end
end