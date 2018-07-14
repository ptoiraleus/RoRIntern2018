class Comment < ActiveRecord::Base
	validates :content, presence: true
	validates :content, length: { in: 1..500 }
end
