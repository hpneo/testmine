class TestSuite < ActiveRecord::Base
  unloadable

  belongs_to :project
  has_many :test_suite_test_cases
  has_many :test_cases, through: :test_suite_test_cases
end
