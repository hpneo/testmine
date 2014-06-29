class TestSuitesController < ApplicationController
  unloadable

  before_filter :find_project
  before_filter :authorize

  def index
    @test_suite = TestSuite.new(project_id: @project.id)
  end

  def show
    @title = "View Test Suite"
    @disabled_form = true
    edit
  end

  def new
    @test_suite = TestSuite.new(project_id: @project.id)

    if params[:use_layout] == "yes"
      use_layout = true
    else
      use_layout = false
    end

    render :new, layout: use_layout
  end

  def edit
    @test_suite = TestSuite.find(params[:id])

    if params[:use_layout] == "yes"
      use_layout = true
    else
      use_layout = false
    end

    render :edit, layout: use_layout
  end

  def create
    @test_suite = TestSuite.new
    @test_suite.name = params[:test_suite][:name]
    @test_suite.summary = params[:test_suite][:summary]
    @test_suite.project_id = @project.try(:id) || params[:test_suite][:project_id]

    if @test_suite.save
      render 'create.js'
    end
  end

  def update
    @test_suite = TestSuite.find(params[:id])
    @test_suite.name = params[:test_suite][:name]
    @test_suite.summary = params[:test_suite][:summary]

    if @test_suite.save
      render 'update.js'
    end
  end

  def destroy
    @test_suite = TestSuite.find(params[:id])

    if @test_suite.destroy
      TestSuiteTestCase.where(test_suite_id: @test_suite.id).destroy_all
      render 'destroy.js'
    end
  end

  private
  def find_project
    identifier = params[:project_id]
    identifier ||= params[:test_suite][:project_id] if params[:test_suite]

    @project = Project.find(identifier)
  end
end