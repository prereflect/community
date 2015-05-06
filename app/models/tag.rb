class Tag < ActiveRecord::Base
  include Sluggable

  has_many :post_tags
  has_many :posts, through: :post_tags

  validates :name, presence: true

  sluggable_column :name
end
