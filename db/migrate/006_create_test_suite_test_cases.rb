class CreateTestSuiteTestCases < ActiveRecord::Migration
  def change
    create_table :test_suite_test_cases do |t|
      t.references :test_suite
      t.references :test_case
      t.column :created_on, :timestamp
      t.column :updated_on, :timestamp
    end
    add_index :test_suite_test_cases, :test_suite_id
    add_index :test_suite_test_cases, :test_case_id
  end
end
