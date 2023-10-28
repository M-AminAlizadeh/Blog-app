require 'rails_helper'

RSpec.describe Comment, type: :model do
  before :all do
    @user = User.create(name: 'Amin')
    @post = Post.create(author: @user, title: 'title')
  end

  context '#create' do
    it 'valid with user and post' do
      expect(Comment.new(user: @user, post: @post)).to be_valid
    end

    it 'invalid without post' do
      expect(Comment.new(user: @user)).to_not be_valid
    end

    it 'invalid without user' do
      expect(Comment.new(post: @post)).to_not be_valid
    end
  end

  context '#update_comments_counter' do
    before :all do
      10.times { |comment_i| Comment.create(user: @user, post: @post, text: (comment_i + 1).to_s) }
    end

    it 'keeps track of comments and equals 10' do
      expect(@post.comments_counter).to eq 10
    end
  end
end
