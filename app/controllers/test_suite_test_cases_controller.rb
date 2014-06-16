class TestSuiteTestCasesController < ApplicationController
  unloadable

  def update
    @test_suite_test_case = TestSuiteTestCase.find(params[:id])
    @test_suite_test_case.test_suite_id = params[:test_suite_test_case][:test_suite_id]
    @previous_test_suite = TestSuite.find(params[:previous_test_suite_id])
    @new_test_suite = TestSuite.find(params[:test_suite_test_case][:test_suite_id])
    @project = Project.find(params[:project_id])

    if @test_suite_test_case.save
      render 'update.js'
    end
  end
end