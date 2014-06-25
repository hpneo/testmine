class CreateTestExecutionIssues < ActiveRecord::Migration
  def change
    create_table :test_execution_issues do |t|
      t.references :test_execution
      t.references :issue
      t.column :created_on, :timestamp
      t.column :updated_on, :timestamp
    end
    add_index :test_execution_issues, :test_execution_id
    add_index :test_execution_issues, :issue_id
  end
end
