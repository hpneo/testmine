class TestExecution < ActiveRecord::Base
  unloadable

  belongs_to :test_case
  belongs_to :test_plan
  belongs_to :test_execution_status
  belongs_to :executed_by, class_name: 'User', foreign_key: :executed_by_user_id

  before_save :set_executed_by

  def set_executed_by
    self.executed_by = User.current if self.test_plan.finished?
  end
end
