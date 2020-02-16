class CreateJoinTableChilddParent < ActiveRecord::Migration[6.0]
  def change
    create_table :children_parents do |t|
      t.integer :child_id
      t.integer :parent_id
    end
  end
end
