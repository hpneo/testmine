class TestCasesController < ApplicationController
  unloadable

  before_filter :find_project
  before_filter :find_test_suite
  before_filter :authorize, except: [ :delete_test_case_step ]
  before_filter :clear_test_case_steps, only: [ :create, :update ]

  after_filter :append_to_test_suite, only: :create

  def index
  end

  def show
    @title = "View Test Case"
    edit
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

  def edit
    @test_case = TestCase.find(params[:id])
    @test_case.test_suite_id = params[:test_suite_id]

    if params[:use_layout] == "yes"
      use_layout = true
    else
      use_layout = false
    end

    render :edit, layout: use_layout
  end

  def create
    @test_case = TestCase.new(params[:test_case])
    @test_suite = TestSuite.find(@test_case.test_suite_id) if @test_case.test_suite_id.present?

    if @test_case.save
      render 'create.js'
    end
  end

  def update
    @test_case = TestCase.find(params[:id])
    @test_suite = TestSuite.find(@test_case.test_suite_id) if @test_case.test_suite_id.present?

    if @test_case.update_attributes(params[:test_case])
      render 'update.js'
    end
  end

  def destroy
    @test_case = TestCase.find(params[:id])
    @test_case.test_suite_id = params[:test_suite_id]

    if @test_case.destroy
      TestSuiteTestCase.where(test_case_id: @test_case.id).destroy_all
      render 'destroy.js'
    end
  end

  def move
    @test_suite_test_case = TestSuiteTestCase.where({
      test_case_id: params[:id],
      test_suite_id: params[:test_suite_id]
    }).first

    if params[:use_layout] == "yes"
      use_layout = true
    else
      use_layout = false
    end

    render :move, layout: use_layout
  end

  def delete_test_case_step
    @test_case_step = TestCaseStep.find(params[:test_case_step_id])
    if @test_case_step && @test_case_step.destroy
      render 'destroy_test_case_step.js'
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

  def append_to_test_suite
    if @test_suite.present?
      @test_suite.test_suite_test_cases << TestSuiteTestCase.new(test_suite_id: @test_suite.id, test_case_id: @test_case.id)
    end
  end

  def clear_test_case_steps
    params[:test_case][:test_case_steps_attributes].each do |i, attrs|
      if attrs[:action].blank? && attrs[:results].blank?
        params[:test_case][:test_case_steps_attributes].delete(i)
      end
    end
  end
end