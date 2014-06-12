class CreateTestCases < ActiveRecord::Migration
  def change
    create_table :test_cases do |t|
      t.string :title
      t.text :summary
      t.text :preconditions
      t.integer :duration
      t.references :test_case_status
      t.references :test_case_execution_type
      t.references :test_case_importance
      t.references :document
      t.column :created_on, :timestamp
      t.column :updated_on, :timestamp
    end
    add_index :test_cases, :test_case_status_id
    add_index :test_cases, :test_case_execution_type_id
    add_index :test_cases, :test_case_importance_id
    add_index :test_cases, :document_id
  end
end
