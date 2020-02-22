class CreateCategoriesTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :categories_tasks, id: false do |t|
      t.references :category, null: false, foreign_key: true
      t.references :task, null: false, foreign_key: true
      t.datetime :date_completed

      t.timestamps
    end
  end
end
