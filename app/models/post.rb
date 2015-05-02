class Post < ActiveRecord::Base
  include Sluggable

  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  has_many :comments

  validates :title, presence: true
  validates :body, presence: true, length: {maximum: 3838}

  sluggable_column :title
end
