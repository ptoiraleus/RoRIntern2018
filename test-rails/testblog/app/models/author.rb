class Author < ActiveRecord::Base
  validates :name, :surname, length: { in: 3..20 }
  validates :name, :surname, presence: true

  scope :old, -> { where('age > 30') }
  scope :young, -> { where('age < 20') }

  before_create :default_age

  # has_many :author_posts
  # has_many :posts, through: :author_posts
  has_many :posts
  has_many :comments

  def fullname
    "#{name} #{surname}"
  end

  private

  def default_age
    self.age = 25 unless age
  end
end
