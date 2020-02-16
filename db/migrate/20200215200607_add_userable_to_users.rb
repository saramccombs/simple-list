class AddUserableToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :userable, polymorphic: true
  end
end
