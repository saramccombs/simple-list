class Child < ApplicationRecord
  has_one :user, as: :user_role
  has_many :children_parents
  has_many :parents, through: :children_parents
end
