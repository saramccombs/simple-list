class CreateParents < ActiveRecord::Migration[6.0]
  def change
    create_table :parents do |t|
      t.string :team_name
      t.timestamps
    end
  end
end
