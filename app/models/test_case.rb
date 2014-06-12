class TestCase < ActiveRecord::Base
  unloadable

  has_many :test_suite_test_cases
  has_many :test_suites, through: :test_suite_test_cases
  has_many :test_case_steps

  belongs_to :test_case_status
  belongs_to :test_case_execution_type
  belongs_to :test_case_importance
  belongs_to :document

  accepts_nested_attributes_for :test_case_steps

  after_initialize :build_steps
  before_save :clean_steps

  def build_steps
    if !self.persisted? || self.test_case_steps.size == 0
      2.times do |i|
        self.test_case_steps.build({
          item: i + 1
        })
      end
    end
  end

  def clean_steps
    self.test_case_steps.select { |step|
      step.action.blank? && step.expected_result.blank?
    }.map(&:destroy)
  end
end
