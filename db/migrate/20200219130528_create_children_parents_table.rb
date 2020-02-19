class CreateChildrenParentsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :children_parents_tables do |t|
      t.belongs_to :child, index: true, foreign_key: true 
      t.belongs_to :parent, index: true, foreign_key: true 
    end
  end
end
