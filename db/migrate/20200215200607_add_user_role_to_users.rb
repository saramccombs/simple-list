class AddUserRoleToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :user_role, polymorphic: true
  end
end
