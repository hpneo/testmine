class InsertTestCaseExecutionTypes < ActiveRecord::Migration
  def change
    ['Manual', 'Automated'].each do |status|
      TestCaseExecutionType.create(name: status)
    end
  end
end
