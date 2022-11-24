class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.references :project, null: false, foreign_key: true
      t.integer :assigned_to

      t.timestamps
    end
  end
end
