class CreateIdeaboards < ActiveRecord::Migration[6.0]
  def change
    create_table :ideaboards do |t|
      t.string :ideaboard_name
      t.string :ideaboard_desc
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
