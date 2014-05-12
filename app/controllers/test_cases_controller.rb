class TestCasesController < ApplicationController
  unloadable

  before_filter :find_project
  before_filter :find_test_suite
  before_filter :authorize

  def index
  end

  def new
    @test_case = TestCase.new(test_suite_id: params[:test_suite_id])

    if params[:use_layout] == "yes"
      use_layout = true
    else
      use_layout = false
    end

    render :new, layout: use_layout
  end

  private
  def find_project
    identifier = params[:project_id]
    identifier ||= params[:test_case][:project_id] if params[:test_case]

    @project = Project.find(identifier)
  end

  def find_test_suite
    identifier = params[:test_suite_id]
    identifier ||= params[:test_case][:test_suite_id] if params[:test_case]

    @test_suite = TestSuite.find(identifier)
  end
end