class TestExecution < ActiveRecord::Base
  unloadable

  belongs_to :test_case
  belongs_to :test_plan
  belongs_to :test_execution_status
  belongs_to :executed_by, class_name: 'User', foreign_key: :executed_by_user_id

  has_many :test_execution_issues
  has_many :issues, through: :test_execution_issues

  accepts_nested_attributes_for :test_case

  before_save :check_test_plan_status

  def check_test_plan_status
    if self.test_plan
      return self.test_plan.executable?
    end
  end

  def executed?
    !self.test_execution_status.nil?
  end
end
