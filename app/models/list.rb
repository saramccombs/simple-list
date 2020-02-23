class List < ApplicationRecord
  belongs_to :user
  belongs_to :ideaboard
  has_many :tasks, dependent: :destroy
  has_many :tags, through: :tasks

  validates :list_name, presence: { message: "is required."}
end
