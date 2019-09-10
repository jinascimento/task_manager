class AddPeopleToTask < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :responsible, references: :people, index: true
    add_foreign_key :tasks, :people, column: :responsible_id
  end
end
