require 'rails_helper'

RSpec.describe Author, type: :model do

  describe 'atrributes' do

    it {expect(subject.attributes).to include('name', 'surname', 'age') } #short version

    # it 'should have proper attributes' do
    #   expect(subject.attributes).to include('name', 'surname', 'age')
    # end
  end

  describe 'validations' do
    it { should validate_presence_of(:name) } #short version using 'shoulda matchers'
    it { should validate_presence_of(:surname) }

    # it 'should require name and surname presence' do
    #   expect(Author.new).not_to be_valid
    #   expect(Author.new(name: 'test')).not_to be_valid
    #   expect(Author.new(name: 'test', surname: 'test')).to be_valid
    # end
  end

  describe 'scopes' do
    it 'should have old scope' do
      author1 = Author.create(name: 'test', surname: 'test', age: 15)
      author2 = Author.create(name: 'test', surname: 'test', age: 40)
      expect(Author.old).to include(author2)
      expect(Author.old).not_to include(author1)
    end
  end

  describe 'callbacks' do
    it 'should set age to 25 if none was given' do
      author = Author.create(name: 'test', surname: 'test')
      expect(author.age).to eq(25)
    end
  end

  describe 'relations' do

    it { should have_many(:posts) } #short version using 'shoulda matchers'

    # it 'should have many posts' do
    #   t = Author.reflect_on_association(:posts)
    #   expect(t.macro).to eq(:has_many)
    # end
  end

  describe '#fullname' do
    it 'should have working #fullname method' do
      author = Author.new(name: 'test', surname: 'test')
      expect(author.fullname).to eq('test test')
    end
  end

end
