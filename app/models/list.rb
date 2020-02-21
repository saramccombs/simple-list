class List < ApplicationRecord
  belongs_to :user
  belongs_to :ideaboard
  has_many :tasks, dependent: :destroy

  validates :list_name, presence: { message: "A list name is required."}
end
