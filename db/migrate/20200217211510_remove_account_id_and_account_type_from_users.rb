class RemoveAccountIdAndAccountTypeFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :account_id
    remove_column :users, :account_type
  end
end
