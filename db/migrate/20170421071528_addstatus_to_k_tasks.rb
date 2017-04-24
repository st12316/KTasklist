class AddstatusToKTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :k_tasks, :status, :string
  end
end
