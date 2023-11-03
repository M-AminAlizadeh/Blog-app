require 'rails_helper'

RSpec.describe 'Users', type: :request do
  context 'GET /index' do
    before :each do
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
      expect(response.body).to include('<h1>list of users</h1>')
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
      expect(response.body).to include('<h1>selected user</h1>')
    end
  end
end
