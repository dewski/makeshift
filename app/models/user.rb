class User < ApplicationRecord
  validates :login, presence: true
  validates :email, presence: true
  validates :github_uid, presence: true, uniqueness: true
  validates :github_token, presence: true

  def self.find_or_create_from_github(auth)
    where(github_uid: auth.uid).first_or_create do |user|
      user.login = auth.info.nickname
      user.email = auth.info.email
      user.github_token = auth.credentials.token
    end
  end
end
