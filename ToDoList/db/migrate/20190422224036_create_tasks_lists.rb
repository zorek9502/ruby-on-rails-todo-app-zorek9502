class CreateTasksLists < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks_lists do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.boolean :completed

      t.timestamps
    end
  end
end
