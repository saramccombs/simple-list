class Parent < ApplicationRecord
  has_one :user, as: :user_role
end
