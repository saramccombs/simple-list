class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[github]

  has_many :ideaboards, dependent: :destroy
  has_many :lists, through: :ideaboards, dependent: :destroy
  has_many :tasks, through: :lists, dependent: :destroy

  validates :name, presence: true
  validates :username, presence: true
  validates :username, uniqueness: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.username = auth.info.nickname
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
      end
  end
end
