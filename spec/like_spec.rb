require 'rails_helper'

RSpec.describe Like, type: :model do
  before :all do
    @user = User.create(name: 'Amin')
    @post = Post.create(author: @user, title: 'title')
  end

  context '#create' do
    it 'valid with user and post' do
      expect(Like.new(user: @user, post: @post)).to be_valid
    end

    it 'invalid without post' do
      expect(Like.new(user: @user)).to_not be_valid
    end

    it 'invalid without user' do
      expect(Like.new(post: @post)).to_not be_valid
    end
  end

  context '#update_likes_counter' do
    before :all do
      10.times { Like.create(user: @user, post: @post) }
    end

    it 'keeps track of likes and equals 10' do
      expect(@post.likes_counter).to eq 10
    end
  end
end
