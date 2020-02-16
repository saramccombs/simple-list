class AddTeamNameToParents < ActiveRecord::Migration[6.0]
  def change
    add_column :parents, :team_name, :string
  end
end
