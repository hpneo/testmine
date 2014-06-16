class InsertTestCaseImportances < ActiveRecord::Migration
  def change
    ['High', 'Medium', 'Low'].each do |status|
      TestCaseImportance.create(name: status)
    end
  end
end
