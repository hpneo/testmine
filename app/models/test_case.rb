class TestCase < ActiveRecord::Base
  unloadable

  belongs_to :test_suite
  has_many :test_case_steps
  accepts_nested_attributes_for :test_case_steps

  after_initialize :build_steps
  before_save :clean_steps

  def build_steps
    if !self.persisted? || self.test_case_steps.size == 0
      2.times do |i|
        self.test_case_steps.build({
          step_order: i + 1
        })
      end
    end
  end

  def clean_steps
    self.test_case_steps.select { |step|
      step.action.blank? && step.results.blank?
    }.map(&:destroy)
  end
end
