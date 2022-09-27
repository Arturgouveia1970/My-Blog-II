require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before(:example) { get users_path } # get(:index)
    it 'it is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "it renders 'index' template" do
      expect(response).to render_template('index')
    end

    it 'it should include "list of users" on the screen' do
      expect(response.body).to include('MyBlogApp')
    end
  end

  describe 'GET #show' do
    # user = User.create!(name: 'Gabrielle', photo: 'mybaby.png', bio: 'A beautiful baby', posts_counter: 0)
    before(:example) { get user_path(1) } # get(:show, params: { id: 2})
    it 'it is a success' do
      expect(response).to have_http_status(:ok)
    end
    #     it "it renders 'show' template" do
    #       expect(response).to render_page('show')
    #     end
    #
    #     it 'it should include "User profile goes here" on the screen' do
    #       expect(response.body).to include('User profile goes here')
    #     end
    #   end
  end
end
