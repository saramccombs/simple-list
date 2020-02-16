class Child < ApplicationRecord
  has_one :user, as: :userable, dependent: :destroy
  has_many :children_parents
  has_many :parents, through: :children_parents
end
