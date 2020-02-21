class List < ApplicationRecord
  belongs_to :ideaboard
  has_many :tasks, dependent: :destroy
end
