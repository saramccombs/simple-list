class Task < ApplicationRecord
  belongs_to :list
  belongs_to :user

  validates :task_priority, presence: { message: "A task priority is required."}
  validates :task_priority, numericality: { 
    greater_than_or_equal_to: 1, 
    less_than_or_equal_to: 3, 
    message: "%{value} is not a valid task priority value."
  }
end
