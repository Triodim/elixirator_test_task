class AddExpirationToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :active, :boolean
    add_column :tasks, :expired_at, :datetime
  end
end
