class Comment < ActiveRecord::Base
	validates :content, :author_id, :post_id, presence: true
	validates :content, length: { in: 10..500 }

	belongs_to :author
	belongs_to :post
end
