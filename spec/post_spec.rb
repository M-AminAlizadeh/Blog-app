require 'rails_helper'

RSpec.describe Post, type: :model do
  before :all do
    @author = User.create(name: 'Amin')
  end

  it 'valid with title' do
    expect(Post.new(author: @author, title: 'Harry Potter')).to be_valid
  end

  it 'invalid for no title' do
    expect(Post.new(author: @author, title: nil)).to_not be_valid
  end

  it 'invalid for title with more than 250 characters' do
    expect(Post.new(author: @author, title: '0' * 251)).to_not be_valid
  end

  it 'invalid with string' do
    expect(Post.new(author: @author, title: 'title', comments_counter: 'five')).to_not be_valid
  end

  it 'invalid with floating point number' do
    expect(Post.new(author: @author, title: 'title', comments_counter: 1.5)).to_not be_valid
  end

  it 'invalid with negative number' do
    expect(Post.new(author: @author, title: 'title', comments_counter: -1)).to_not be_valid
  end

  it 'valid with postive whole number' do
    expect(Post.new(author: @author, title: 'title', comments_counter: 5)).to be_valid
  end

  context '#display_five_recent_comments' do
    before :all do
      @post = Post.create(author: @author, title: 'title')
      10.times { |comment_i| Comment.create(user: @author, post: @post, text: (comment_i + 1).to_s) }
    end

    it 'returns five comments as a number' do
      expect(@post.display_five_recent_comments.length).to eq 5
    end

    it 'returns last 5 comments' do
      texts = []
      @post.display_five_recent_comments.each do |comment|
        texts.push(comment.text.to_i)
      end
      expect(texts).to contain_exactly(6, 7, 8, 9, 10)
    end
  end

  context '#update_posts_counter' do
    before :all do
      10.times { Post.create(author: @author, title: 'title') }
    end

    it 'tracking posts and equals 11' do
      expect(@author.posts_counter).to eq 11
    end
  end
end
