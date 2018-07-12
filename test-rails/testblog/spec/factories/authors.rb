FactoryBot.define do
	factory :author do
		name { Faker::Name.first_name } #Faker gives us ranodm data
		surname { Faker::Name.last_name }
		age { Faker::Number.between(10, 70) }
	end
end
