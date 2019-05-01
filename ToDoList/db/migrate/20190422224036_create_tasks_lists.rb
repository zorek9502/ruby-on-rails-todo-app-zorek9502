class CreateTasksLists < ActiveRecord::Migration[5.2]
  def change
    create_table :task_lists do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
