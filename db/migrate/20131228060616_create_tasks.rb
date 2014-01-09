class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.datetime :due_date
      t.integer :list_id
      t.integer :creator_id, :null=>false
      t.boolean :complete, :default=>false
      t.boolean :is_public, :default=>false

      t.timestamps
    end
  end
end
