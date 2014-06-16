class TestCaseStep < ActiveRecord::Base
  unloadable

  attr_accessible :item, :action, :expected_result, :test_case_id

  belongs_to :test_case
end
