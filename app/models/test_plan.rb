class TestPlan < ActiveRecord::Base
  unloadable

  attr_accessible :title, :summary, :start_on, :finish_on, :created_by_user_id, :executed_by_user_id, :project_id

  belongs_to :project

  belongs_to :test_plan_status
  belongs_to :executed_by, class_name: 'User', foreign_key: :executed_by_user_id
  belongs_to :created_by, class_name: 'User', foreign_key: :created_by_user_id

  has_many :test_executions
  has_many :test_cases, through: :test_executions

  before_create :set_created_by
  before_save :set_finish_on

  def finished?
    if self.test_plan_status.nil?
      false
    else
      self.test_plan_status.name.to_s.in?(["Complete", "Incomplete", "Canceled"])
    end
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
