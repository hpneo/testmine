class TestPlansController < ApplicationController
  unloadable

  before_filter :find_project
  before_filter :authorize, except: [ :add_test_case ]

  after_filter :set_finish_on, on: [ :update ]

  def show
    @title = "View Test Plan"
    edit
  end

  def new
    @test_plan = TestPlan.new(project_id: @project.id)

    if params[:use_layout] == "yes"
      use_layout = true
    else
      use_layout = false
    end

    render :new, layout: use_layout
  end

  def edit
    @test_plan = TestPlan.find(params[:id])

    if params[:use_layout] == "yes"
      use_layout = true
    else
      use_layout = false
    end

    render :edit, layout: use_layout
  end

  def create
    @test_plan = TestPlan.new(params[:test_plan])
    @test_plan.project_id = @project.try(:id) || params[:test_plan][:project_id]

    if @test_plan.save
      render 'create.js'
    end
  end

  def update
    @test_plan = TestPlan.find(params[:id])

    if @test_plan.update_attributes(params[:test_plan])
      render 'update.js'
    end
  end

  def add_test_case
    @test_plan = TestPlan.find(params[:id])
    @test_execution = TestExecution.new
    @test_execution.test_plan_id = @test_plan.id

    if params[:use_layout] == "yes"
      use_layout = true
    else
      use_layout = false
    end

    render :add_test_case, layout: use_layout
  end

  def destroy
    @test_plan = TestPlan.find(params[:id])

    if @test_plan.destroy
      TestExecution.where(test_plan_id: @test_plan.id).destroy_all
      render 'destroy.js'
    end
  end

  private
  def find_project
    identifier = params[:project_id]
    identifier ||= params[:test_plan][:project_id] if params[:test_plan]

    @project = Project.find(identifier)
  end

  def set_finish_on
    if @test_plan && @test_plan.finished?
      @test_plan.finish_on = DateTime.now
      @test_plan.save
    end
  end
end