class CreateTestCaseExecutionTypes < ActiveRecord::Migration
  def change
    create_table :test_case_execution_types do |t|
      t.string :name
      t.text :description
      t.column :created_on, :timestamp
      t.column :updated_on, :timestamp
    end
  end
end
