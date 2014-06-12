class TestPlan < ActiveRecord::Base
  unloadable

  belongs_to :test_plan_status
  belongs_to :executed_by, class_name: 'User', foreign_key: :executed_by_user_id
  belongs_to :created_by, class_name: 'User', foreign_key: :created_by_user_id
end
