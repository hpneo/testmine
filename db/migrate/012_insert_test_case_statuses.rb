class InsertTestCaseStatuses < ActiveRecord::Migration
  def change
    ['Draft', 'Ready to Review', 'Review in progress', 'Rework', 'Obsolete', 'Future', 'Final'].each do |status|
      TestCaseStatus.create(name: status)
    end
  end
end
