require 'rails_helper'

describe UsersController, type: :controller do
  #let(:user) { User.create!(first_name: "John", last_name: "Smith", email: "j.smith@example.com", password: "xyzxyz") }
  before do 
    user = User.create!(first_name: "John", last_name: "Smith", email: "j.smith@example.com", password: "xyzxyz")
    user2 = User.create!(first_name: "Suzy", last_name: "Sue", email: "s.sue@example.com", password: "123456")
  end

  describe 'GET #show' do
    context 'when user is logged in' do
      before do
        sign_in user
      end

      it 'loads correct user details' do
        get :show, params: { id: user.id }
        expect(response).to be_ok #is there other way to show this?
        expect(assigns(:user)).to eq user 

      end

    end

    context 'when user is not logged in' do
      it 'redirects to login' do
        get :show, params: { id: user.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'user cannot access other user page' do
      before do
        sign_in user2
      end
      it 'redirects to root path' do
        get :show, params: { id: user.id }
        expect(response).to redirect_to(root_path)
      end
    end

  end
end



    