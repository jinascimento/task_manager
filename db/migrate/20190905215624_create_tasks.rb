class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :status
      t.string :title
      t.string :description
      t.datetime :start
      t.datetime :end
      t.string :color
      t.integer :priority

      t.timestamps
    end
  end
end
