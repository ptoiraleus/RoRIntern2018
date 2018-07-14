require 'rails_helper'

RSpec.describe Comment, type: :model do

	describe 'atrributes' do
		it {expect(subject.attributes).to include('content', 'post_id', 'author_id') }
	end

	describe 'validates' do
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:author_id) }
		it { should validate_presence_of(:post_id) }
		it { should validate_length_of(:content).is_at_least(10).is_at_most(500) }

		describe 'associations' do
			it { should belong_to(:post) } #short version using 'shoulda matchers'
			it { should belong_to(:author) }
		end

	end
end
