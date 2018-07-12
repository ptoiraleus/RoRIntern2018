require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'atrributes' do

    it { expect(subject.attributes).to include('title', 'content', 'author_id') } #short version

    # it 'should have proper attributes' do
    #   expect(subject.attributes).to include('title', 'content', 'author_id')
    # end
  end

  describe 'validates' do

    it { should validate_presence_of(:title) }  #short version using 'shoulda matchers'
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:author_id) }

    # it 'should require title, content and author_id' do
    #   author = Author.create(name:'tester', surname: 'tester')
    #   expect(Post.new).not_to be_valid
    #   expect(Post.new(title: 'test1')).not_to be_valid
    #   expect(Post.new(title: 'test2', content: 'testtesttesttest')).not_to be_valid
    #   expect(Post.new(title: 'test3', content: 'testtesttesttest', author_id: author.id)).to be_valid
    # end

    it { should validate_length_of(:content).is_at_least(10).is_at_most(500) } #short version using 'shoulda matchers'

    # it 'should require content to be in between 10 .. 500 charachters' do
    #   author = Author.create(name:'tester', surname: 'tester')
    #   expect(Post.new(title: 'test1', content: 'a'*10, author_id: author.id)).to be_valid
    #   expect(Post.new(title: 'test2', content: 'a'*9, author_id: author.id)).not_to be_valid
    #   expect(Post.new(title: 'test1', content: 'a'*500, author_id: author.id)).to be_valid
    #   expect(Post.new(title: 'test2', content: 'a'*501, author_id: author.id)).not_to be_valid
    # end

    it { should validate_length_of(:title).is_at_most(80) } #short version using 'shoulda matchers'

    # it 'should require title to be maximum 80 charachters' do
    #   author = Author.create(name:'tester', surname: 'tester')
    #   expect(Post.new(title: 'a'*80, content: 'testtesttesttest', author_id: author.id)).to be_valid
    #   expect(Post.new(title: 'a'*81, content: 'testtesttesttest', author_id: author.id)).not_to be_valid
    # end

    it { should validate_uniqueness_of(:title) } #short version using 'shoulda matchers'

    # it 'should require title to be unique' do
    #   author = Author.create(name:'tester', surname: 'tester')
    #   post = Post.create(title: 'test', content: 'testtesttesttest', author_id: author.id)
    #   expect(Post.new(title: 'test', content: 'testtesttesttest', author_id: author.id)).not_to be_valid
    # end
  end


  describe 'scopes' do
    it 'should have old scope' do
      author = Author.create(name:'tester', surname: 'tester')
      new_time = Time.now - 120.minute
      Timecop.freeze(new_time)
      post1 = Post.create(title: 'test1', content: 'testtesttesttest', author_id: author.id)
      new_time = Time.now
      Timecop.return
      post2 = Post.create(title: 'test2', content: 'testtesttesttest', author_id: author.id)
      expect(Post.old).to include(post1)
      expect(Post.old).not_to include(post2)
    end
  end

  describe 'associations' do

    it { should have_many(:comments) } #short version using 'shoulda matchers'
    it { should belong_to(:author) }

    # it 'should have many comments' do
    #   t = Post.reflect_on_association(:comments)
    #   expect(t.macro).to eq(:has_many)
    # end
    #
    # it 'should belong to author' do
    #   t = Post.reflect_on_association(:author)
    #   expect(t.macro).to eq(:belongs_to)
    # end
  end
end
