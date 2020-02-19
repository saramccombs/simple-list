class Parent < ApplicationRecord
  has_many :chilren_parents
  has_many :parents, through: :children_parents
end
