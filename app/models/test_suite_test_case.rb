class TestSuiteTestCase < ActiveRecord::Base
  unloadable

  belongs_to :test_suite
  belongs_to :test_case
end
