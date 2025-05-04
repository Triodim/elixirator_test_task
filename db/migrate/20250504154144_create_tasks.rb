class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.integer :status
      t.references :project, null: false, foreign_key: true
      t.integer :parent_id

      t.timestamps
    end
  end
end
