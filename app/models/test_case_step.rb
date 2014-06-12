class TestCaseStep < ActiveRecord::Base
  unloadable

  attr_accessible :item, :action, :expected_result

  belongs_to :test_case
end
