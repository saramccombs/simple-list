class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :list_name
      t.string :list_desc
      t.belongs_to :ideaboard, null: false, foreign_key: true

      t.timestamps
    end
  end
end
