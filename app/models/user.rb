class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :omniauthable, :omniauth_providers => [:google_oauth2]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :person, foreign_key: :people_id
  accepts_nested_attributes_for :person

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      @user = user
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.person = Person.new(name: auth.info.first_name)
      user.token = auth.credentials.token
      user.expires = auth.credentials.expires
      user.expires_at = auth.credentials.expires_at
      user.refresh_token = auth.credentials.refresh_token
    end
  end
end
