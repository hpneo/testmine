class InsertTestExecutionStatuses < ActiveRecord::Migration
  def change
    ['Passed', 'Failed', 'Blocked'].each do |status|
      TestExecutionStatus.create(name: status)
    end
  end
end
