class CreateTestCaseSteps < ActiveRecord::Migration
  def change
    create_table :test_case_steps do |t|
      t.integer :step_order
      t.string :action
      t.string :results
      t.references :test_case
    end
    add_index :test_case_steps, :test_case_id
  end
end
