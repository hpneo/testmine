require_dependency 'project'

module Testmine
  module ProjectPatch
    def self.included(base)
      base.class_eval do
        unloadable

        has_many :test_suites
        has_many :test_cases, :through => :test_suites
      end
    end
  end
end

unless Project.included_modules.include? Testmine::ProjectPatch
  Project.send(:include, Testmine::ProjectPatch)
end