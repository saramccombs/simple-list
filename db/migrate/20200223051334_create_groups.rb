class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :chore, null: false, foreign_key: true
      t.string :groupname

      t.timestamps
    end
  end
end
