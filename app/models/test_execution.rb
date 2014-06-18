class TestExecution < ActiveRecord::Base
  unloadable

  belongs_to :test_case
  belongs_to :test_plan
  belongs_to :test_execution_status
  belongs_to :executed_by, class_name: 'User', foreign_key: :executed_by_user_id

  before_save :set_executed_by

  accepts_nested_attributes_for :test_case

  def set_executed_by
    if self.test_plan
      if self.test_plan.finished?
        self.executed_by = User.current#self.test_plan.executed_by || User.current
      end
    end
  end
end
