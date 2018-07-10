class Author < ActiveRecord::Base
  validates :name, :surname, length: { in: 3..20 }
  validates :name, :surname, presence: true

  has_many :author_posts
  has_many :posts, through: :author_posts
  has_many :comments
end
