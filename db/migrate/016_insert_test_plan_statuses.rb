class InsertTestPlanStatuses < ActiveRecord::Migration
  def change
    ['Open', 'In progress', 'Complete', 'Incomplete', 'Canceled'].each do |status|
      TestPlanStatus.create(name: status)
    end
  end
end
