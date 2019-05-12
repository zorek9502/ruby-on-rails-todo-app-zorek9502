class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.boolean :completed, default: false
      t.string :description
      t.references :task_list, foreign_key: true

      t.timestamps
    end
  end
end
