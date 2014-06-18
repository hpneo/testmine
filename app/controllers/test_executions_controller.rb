class TestExecutionsController < ApplicationController
  unloadable

  before_filter :find_project
  before_filter :authorize

  def create
    @test_execution = TestExecution.new
    @test_execution.test_plan_id = params[:test_execution][:test_plan_id]
    @test_execution.test_case_id = params[:test_execution][:test_case_id]
    @test_case = TestCase.find(params[:test_execution][:test_case_id])

    if @test_execution.save
      render 'create.js'
    end
  end

  private
  def find_project
    identifier = params[:project_id]

    @project = Project.find(identifier)
  end
end