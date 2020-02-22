class Category < ApplicationRecord
  has_many :categories_tasks
  has_many :tasks, through: :categories_tasks
end
