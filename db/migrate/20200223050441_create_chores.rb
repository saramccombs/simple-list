class CreateChores < ActiveRecord::Migration[6.0]
  def change
    create_table :chores do |t|
      t.string :chore_desc
      t.string :chore_priority

      t.timestamps
    end
  end
end
