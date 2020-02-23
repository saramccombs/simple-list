class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string :tag_name

      t.timestamps
    end

    add_reference :tasks, :tag, foreign_key: true
  end
end
