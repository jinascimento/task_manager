class AddUserToPerson < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :people, index: true
  end
end
