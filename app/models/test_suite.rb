class TestSuite < ActiveRecord::Base
  unloadable

  attr_accessible :name, :summary, :project_id

  belongs_to :project
  has_many :test_suite_test_cases
  has_many :test_cases, through: :test_suite_test_cases
end
