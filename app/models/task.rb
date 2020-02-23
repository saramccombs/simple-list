class Task < ApplicationRecord
  belongs_to :list
  belongs_to :user
  belongs_to :tag

  validates :task_priority, presence: { message: "is required."}
  validates :task_desc, presence: { message: "is required."}

  def self.high_priority
    where(task_priority: "high")
  end

  def self.find_list(id)
    where(list_id: id)
  end

  def self.medium_priority
    where(task_priority: "medium")
  end

  def self.low_priority
    where(task_priority: "low")
  end

  def self.no_priority
    where(task_priority: "n/a")
  end
end
