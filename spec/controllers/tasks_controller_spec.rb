require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  context 'User is logged in' do
    login_user

    it 'should have a current_user' do
      expect(subject.current_user).to_not eq(nil)
    end

    describe '#index' do
      it 'when params valid' do
        start_date = DateTime.now
        end_date = DateTime.now + 1
        responsible = create(:person)
        create(:task, start: start_date, end: end_date, responsible: responsible)
        get :index, params: { start: start_date, end: end_date }, format: :json

        expect(assigns(:tasks).blank?).to be_falsey
      end

      it 'when params invalid' do
        start_date = DateTime.now
        end_date = DateTime.now + 1
        responsible = create(:person)
        create(:task, start: start_date, end: end_date, responsible: responsible)
        get :index, params: { start: '', end: '' }, format: :json

        expect(assigns(:tasks).blank?).to be_truthy
      end
    end

    describe '#show' do
      before do
        responsible = create(:person)
        @task = create(:task, start: DateTime.now, end: DateTime.now + 1, responsible: responsible)
      end

      it 'when params valid' do
        get :show, params: { id: @task.id }, format: :json
        expect(response).to have_http_status(:no_content)
      end

      it 'when without params' do
        get :index, params: { id: '' }, format: :json
        expect(response).to have_http_status(:ok)
      end
    end

    describe '#new' do
      it 'new instance' do
        get :new, xhr: true
        expect(response).to render_template(:new)
      end
    end

    describe '#create' do
      it 'save when params is valid' do
        responsible = create(:person)
        task = build(:task, start: DateTime.now, end: DateTime.now + 1, responsible: responsible)
        post :create, params: { task: task.attributes }, xhr: true

        expect(response).to have_http_status(:created)
      end

      it 'not save when params is invalid' do
        post :create, params: { task: { title: 'Vai falhar' } }, xhr: true
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    describe '#update' do
      before do
        responsible = create(:person)
        @task = create(:task, start: DateTime.now, end: DateTime.now + 1, responsible: responsible)
      end
      it 'update when params is valid' do
        @task.title = 'Test update'
        put :update, params: { id: @task.id, task: @task.attributes }, xhr: true
        expect(response).to have_http_status(:ok)
      end

      it 'not update when params is invalid' do
        @task.title = ''
        put :update, params: { id: @task.id, task: @task.attributes }, xhr: true
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end


    it 'destroy' do
      responsible = create(:person)
      task = create(:task, start: DateTime.now, end: DateTime.now + 1, responsible: responsible)
      delete :destroy, params: { id: task.id }, xhr: true
      expect(response).to have_http_status(:ok)
    end

  end

  context "User isn't logged in" do
    it 'should return status 302 (redirect to sign_in page)' do
      get :index
      expect(response).to have_http_status(302)
    end
  end
end
