require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  context 'User is logged in' do
    login_user

    it 'should return status 200' do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  context "User isn't logged in" do
    it 'should return status 302 (redirect to sign_in page)' do
      get :index
      expect(response).to have_http_status(302)
    end
  end
end
