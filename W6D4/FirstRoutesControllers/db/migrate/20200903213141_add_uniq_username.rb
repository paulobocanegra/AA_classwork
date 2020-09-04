class AddUniqUsername < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :username, unique: true
  end
end
