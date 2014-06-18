class TestmineController < ApplicationController
  unloadable

  before_filter :find_project
  before_filter :authorize

  def index
    @test_suite = TestSuite.new(project_id: @project.id)
    @test_plan = TestPlan.new(project_id: @project.id)
    @test_execution = TestExecution.new
    @test_execution.test_case = TestCase.new
  end

  private
  def find_project
    identifier = params[:project_id]

    @project = Project.find(identifier)
  end
end