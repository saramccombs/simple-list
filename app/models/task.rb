class Task < ApplicationRecord
  belongs_to :list
  belongs_to :user
  has_many :categories_tasks
  has_many :categories, through: :categories_tasks

  validates :task_priority, presence: { message: "is required."}
  validates :task_desc, presence: { message: "is required."}
end
