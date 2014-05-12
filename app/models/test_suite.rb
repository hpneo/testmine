class TestSuite < ActiveRecord::Base
  unloadable

  belongs_to :project
  has_many :test_cases
end
