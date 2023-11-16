require 'rails_helper'

RSpec.describe 'Users', type: :request do
  context 'GET /index' do
    before :each do
      User.create(name: 'Tom')
      get users_path
    end

    it 'tests http status 200' do
      expect(response.status).to eq(200)
    end

    it 'tests successful response' do
      expect(response).to be_successful
    end

    it 'displays the right view file' do
      expect(response).to render_template(:index)
    end

    it 'displays the right placeholder' do
      expect(response.body).to include('<h2>Tom</h2>')
    end
  end

  context 'GET /show' do
    let(:valid_attributes) { { 'name' => 'Amin' } }
    let(:user) { User.create! valid_attributes }
    before :each do
      get user_url(user)
    end

    it 'tests http status 200' do
      expect(response.status).to eq(200)
    end

    it 'tests successful response' do
      expect(response).to be_successful
    end

    it 'displays the right view file' do
      expect(response).to render_template(:show)
    end

    it 'displays the right placeholder' do
      expect(response.body).to include('<h2>Tom</h2>')
      expect(response.body).to include('<p>Number of posts: 0</p>')
      expect(response.body).to include('<h3>Bio</h3>')
    end
  end
end
