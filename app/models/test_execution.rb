class TestExecution < ActiveRecord::Base
  unloadable

  belongs_to :test_case
  belongs_to :test_plan
  belongs_to :test_execution_status
  belongs_to :executed_by, class_name: 'User', foreign_key: :executed_by_user_id

  accepts_nested_attributes_for :test_case

  def executed?
    !self.test_execution_status.nil?
  end
end
