class CreateTestSuites < ActiveRecord::Migration
  def change
    create_table :test_suites do |t|
      t.string :name
      t.text :description
      t.references :project
    end
    add_index :test_suites, :project_id
  end
end
