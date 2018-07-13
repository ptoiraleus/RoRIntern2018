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
    # let(:author1) { Author.create(name: 'test', surname: 'test', age: 15) } #it will be available for every 'it' in this describe as a variable
    # let(:author2) { Author.create(name: 'test', surname: 'test', age: 40) } #we can use ! to make it call it (let!(:author)) befere 'it' it needs
    let(:author1) { create(:author, age: 15) }
    let(:author2) { create(:author, age: 40) }

    it 'should have old scope' do
      # author1 = Author.create(name: 'test', surname: 'test', age: 15)
      # author2 = Author.create(name: 'test', surname: 'test', age: 40)
      expect(Author.old).to include(author2)
      expect(Author.old).not_to include(author1)
    end
let(:author1) { create(:author, age: 15) }
    it 'should have young scope' do
      expect(Author.young).not_to include(author2)
      expect(Author.young).to include(author1)
    end
  end

  describe 'callbacks' do
    # let(:author) { Author.create(name: 'test', surname: 'test') }
    let(:author) { create(:author, age: nil) } #editing factory

    it 'should set age to 25 if none was given' do
      #author = Author.create(name: 'test', surname: 'test')
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

    #create(:author) #looks for a factory which we defined in our factories and it will save it in db
    #build(:author) # -----||------ but it doesnt save it in db

    # let(:author) { Author.create(name: 'test', surname: 'test') }
      let(:author) { create(:author) }
    it 'should have working #fullname method' do
      #author = Author.new(name: 'test', surname: 'test')
      expect(author.fullname).to eq("#{author.name} #{author.surname}")
    end
  end

end
