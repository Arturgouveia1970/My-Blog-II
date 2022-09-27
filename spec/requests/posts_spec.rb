require 'rails_helper'
RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    before(:example) { get '/users/2/posts' } # get(:index)
    it 'it is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "it renders 'index' template" do
      expect(response).to render_template('index')
    end

    it 'it should include "Posts details" on the screen' do
      expect(response.body).to include('Posts details')
    end
  end

  describe 'GET #show' do
    before(:example) { get '/users/2/posts/2' } # get(:show, params: { id: 2 })
    it 'it is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "it renders 'show' template" do
      expect(response).to render_template('show')
    end

    it 'update_users_posts_counter should increment the total posts by 1' do
      expect(user.post_counter).not_to eq(0)
    end
  end
end
