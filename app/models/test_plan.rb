class TestPlan < ActiveRecord::Base
  unloadable

  belongs_to :project

  belongs_to :test_plan_status
  belongs_to :executed_by, class_name: 'User', foreign_key: :executed_by_user_id
  belongs_to :created_by, class_name: 'User', foreign_key: :created_by_user_id

  before_create :set_created_by
  before_save :set_finish_on

  def finished?
    self.test_plan_status.name.to_s.in?(["Complete", "Incomplete", "Canceled"])
  end

  def modifiable?
    !finished?
  end

  def executable?
    !finished?
  end

  private

  def set_created_by
    self.created_by = User.current
  end

  def set_finish_on
    if finished?
      self.finish_on = DateTime.now
    end
  end
end
