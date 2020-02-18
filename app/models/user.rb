class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[github]

  belongs_to :parent, optional: true
  belongs_to :child, optional: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.username = auth.info.nickname
      user.password = Devise.friendly_token[0, 20]
      user.parent_attributes=({name: auth.info.name, team_name: auth.info.name + " Team"})
      end
  end

  def parent_attributes=(parent_attributes)
    self.create_parent(parent_attributes)
  end

  def child_attributes=(child_attributes)
    self.create_child(child_attributes)
  end
end

