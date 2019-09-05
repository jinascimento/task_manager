class AddPeopleToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :responsible_id, :integer, index: true
    add_foreign_key :tasks, :people, column: :responsible_id
    add_column :tasks, :creator_id, :integer, index: true
    add_foreign_key :tasks, :people, column: :creator_id
  end
end
