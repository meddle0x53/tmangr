class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :description
      t.string :state

      t.integer :owner_id
      t.integer :performer_id

      t.timestamps
    end

    add_index :tasks, :owner_id
    add_index :tasks, :performer_id
  end
end
