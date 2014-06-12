class CreateTestPlans < ActiveRecord::Migration
  def change
    create_table :test_plans do |t|
      t.string :title
      t.text :summary
      t.datetime :start_on
      t.datetime :finish_on
      t.integer :created_by_user_id
      t.integer :executed_by_user_id
      t.references :test_plan_status
      t.column :created_on, :timestamp
      t.column :updated_on, :timestamp
    end
    add_index :test_plans, :test_plan_status_id
    add_index :test_plans, :created_by_user_id
    add_index :test_plans, :executed_by_user_id
  end
end
