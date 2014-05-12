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

  def create
    @test_case = TestCase.new
    @test_case.title = params[:test_case][:title]
    @test_case.summary = params[:test_case][:summary]
    @test_case.preconditions = params[:test_case][:preconditions]
    @test_case.status = params[:test_case][:status]
    @test_case.importance = params[:test_case][:importance]
    @test_case.execution_time = params[:test_case][:execution_time]
    @test_case.test_suite_id = params[:test_case][:test_suite_id]

    if @test_case.save
      render 'create.js'
    end
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