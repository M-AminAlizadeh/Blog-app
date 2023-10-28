require 'rails_helper'

RSpec.describe User, type: :model do
  context '#create' do
    it 'valid with name' do
      expect(User.create(name: 'Amin')).to be_valid
    end

    it 'not valid without name' do
      expect(User.create(name: nil)).to_not be_valid
    end

    it 'not valid with string' do
      expect(User.create(name: 'Amin', posts_counter: 'five')).to_not be_valid
    end

    it 'not valid with floating point number' do
      expect(User.create(name: 'Amin', posts_counter: 1.5)).to_not be_valid
    end

    it 'not valid with negative number' do
      expect(User.create(name: 'Amin', posts_counter: -1)).to_not be_valid
    end

    it 'valid with postive whole number' do
      expect(User.create(name: 'Amin', posts_counter: 5)).to be_valid
    end
  end

  context '#display_three_recent_posts' do
    before :all do
      @user = User.create(name: 'Amin')
      5.times { |post_i| Post.create(author: @user, title: (post_i + 1).to_s) }
    end

    it 'returns three posts' do
      expect(@user.display_three_recent_posts.length).to eq 3
    end
  end
end
