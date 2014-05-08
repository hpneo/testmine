class CreateTestCases < ActiveRecord::Migration
  def change
    create_table :test_cases do |t|
      t.string :title
      t.text :summary
      t.text :preconditions
      t.string :status
      t.string :importance
      t.integer :execution_time
      t.references :test_suite
    end
    add_index :test_cases, :test_suite_id
  end
end
