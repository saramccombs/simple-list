class Parent < ApplicationRecord
  has_one :user, as: :userable, dependent: :destroy
  has_many :children_parents
  has_many :children, through: :children_parents
end
