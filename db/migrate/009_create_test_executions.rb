class CreateTestExecutions < ActiveRecord::Migration
  def change
    create_table :test_executions do |t|
      t.integer :duration
      t.datetime :executed_on
      t.text :comment
      t.integer :executed_by_user_id
      t.references :test_case
      t.references :test_plan
      t.references :test_execution_status
      t.column :created_on, :timestamp
      t.column :updated_on, :timestamp
    end
    add_index :test_executions, :executed_by_user_id
    add_index :test_executions, :test_case_id
    add_index :test_executions, :test_plan_id
    add_index :test_executions, :test_execution_status_id
  end
end
