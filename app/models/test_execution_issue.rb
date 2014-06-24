class TestExecutionIssue < ActiveRecord::Base
  unloadable

  belongs_to :test_execution
  belongs_to :issue
end
