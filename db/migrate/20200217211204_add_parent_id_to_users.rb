class AddParentIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :parent, foreign_key: true
  end
end
