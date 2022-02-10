class AddStatusFinishedToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :finished, :boolean, null: false
  end
end
