class CreateTestCaseImportances < ActiveRecord::Migration
  def change
    create_table :test_case_importances do |t|
      t.string :name
      t.text :description
      t.column :created_on, :timestamp
      t.column :updated_on, :timestamp
    end
  end
end
