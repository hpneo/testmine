class TestExecutionIssuesController < ApplicationController
  unloadable

  def create
    @test_execution_issue = TestExecutionIssue.new
    @test_execution_issue.issue_id = params[:test_execution_issue][:issue_id]
    @test_execution_issue.test_execution_id = params[:test_execution_issue][:test_execution_id]

    if @test_execution_issue.save
      render json: @test_execution_issue
    end
  end
end