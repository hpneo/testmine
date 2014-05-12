class TestSuitesController < ApplicationController
  unloadable

  before_filter :find_project
  before_filter :authorize

  def index
    @test_suite = TestSuite.new(project_id: @project.id)
  end

  def new
    @test_suite = TestSuite.new(project_id: @project.id)
  end

  def create
    @test_suite = TestSuite.new
    @test_suite.name = params[:test_suite][:name]
    @test_suite.description = params[:test_suite][:description]
    @test_suite.project_id = @project.try(:id) || params[:test_suite][:project_id]

    if @test_suite.save
      render 'create.js'
    end
  end

  private
  def find_project
    identifier = params[:project_id]
    identifier ||= params[:test_suite][:project_id] if params[:test_suite]

    @project = Project.find(identifier)
  end
end