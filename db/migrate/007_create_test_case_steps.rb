class CreateTestCaseSteps < ActiveRecord::Migration
  def change
    create_table :test_case_steps do |t|
      t.integer :item
      t.string :action
      t.string :expected_result
      t.references :test_case
      t.column :created_on, :timestamp
      t.column :updated_on, :timestamp
    end
    add_index :test_case_steps, :test_case_id
  end
end
