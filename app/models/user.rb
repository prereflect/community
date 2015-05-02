class User < ActiveRecord::Base
  include Sluggable

  has_many :posts
  has_many :comments

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: {minimum: 5}
  validates :bio, length: {maximum: 140}

  has_secure_password validations: false
  sluggable_column :username

  def admin?
    self.role == 'admin'
  end

  mount_uploader :avatar, AvatarUploader
end
