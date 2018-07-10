class Post < ActiveRecord::Base
  validates :title, :content, presence: true
  validates :title, uniqueness: true
  validates :title, length: { maximum: 80 }
  validates :content, length: { in: 10..500 }

  scope :old, ->{where('created_at > ?', 40.minute)}
  has_many :author_posts
  has_many :authors, through: :author_posts
  has_many :comments

  # belongs_to :author
  # before_create :annotate_author
  #
  # def annotate_author
  #   self.author = self.author + " from Binarapps"
  # end
end
