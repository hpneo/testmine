class CreateTestSuites < ActiveRecord::Migration
  def change
    create_table :test_suites do |t|
      t.string :name
      t.text :summary
      t.references :project
      t.column :created_on, :timestamp
      t.column :updated_on, :timestamp
    end
    add_index :test_suites, :project_id
  end
end
