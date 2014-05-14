class TestCaseStep < ActiveRecord::Base
  unloadable

  attr_accessible :step_order, :action, :results

  belongs_to :test_case
end
