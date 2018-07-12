FactoryBot.define do
	factory :post do
		title 'Test Title'
		content 'Test Content'
		#association :author, factory: :author #association to author
		author #shorter version on ^^
	end
end
