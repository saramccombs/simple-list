class Task < ApplicationRecord
  belongs_to :list
  belongs_to :user

  validates :task_priority, presence: { message: "A task priority is required."}
  validates :task_desc, presence: { message: "A task description is required."}
end
