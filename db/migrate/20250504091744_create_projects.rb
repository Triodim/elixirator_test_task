class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.text :name
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
