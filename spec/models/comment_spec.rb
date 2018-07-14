require 'rails_helper'

RSpec.describe Comment, type: :model do

	describe 'atrributes' do
		it {expect(subject.attributes).to include('content', 'post_id', 'author_id') }
	end

	describe 'validates' do
    it { should validate_presence_of(:content) }
		it { should validate_length_of(:content).is_at_least(1).is_at_most(500) }
	end
end
