require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
  context 'Successful registration' do
    before :each do
      request.env['devise.mapping'] = Devise.mappings[:user]
    end

    it '#new' do
      get :new
      expect(response).to have_http_status(200)
    end

    it '#create' do
      user = { email: 'testeregistro@teste.com', password: 123456,
                      password_confirmation: 123456, person_attributes: {name: 'Testes'}}
      expect { post :create, params: { user: user } }.to change { User.count }.by(1)

    end
  end

  context 'fail registration' do
    before :each do
      request.env['devise.mapping'] = Devise.mappings[:user]
    end

    it 'create new user with valid attributes' do
      user = { email: '', password: '',
               password_confirmation: '', person_attributes: { name: '' }}
      expect { post :create, params: { user: user } }.to_not change { User.count }

    end
  end
end
