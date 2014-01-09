class CreateTaskLists < ActiveRecord::Migration
  def change
    create_table :task_lists do |t|
      t.integer :owner_id

      t.string :name

      t.timestamps
    end
  end
end
