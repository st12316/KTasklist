class CreateKTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :k_tasks do |t|
      t.string :content

      t.timestamps
    end
  end
end
