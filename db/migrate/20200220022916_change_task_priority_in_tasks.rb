class ChangeTaskPriorityInTasks < ActiveRecord::Migration[6.0]
  def change
    change_column :tasks, :task_priority, :string
  end
end
