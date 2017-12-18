require 'rails_helper'

describe UsersController do

  before do
    #@user = User.create(first_name: "John", last_name: "Smith", email: "j.smith@example.com", password: "xyzxyz")
    #@user2 = User.create(first_name: "Suzy", last_name: "Sue", email: "s.sue@example.com", password: "123456")

    @user = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
  end

  describe 'GET #show' do
    context 'when a user is logged in' do
      before do
        sign_in @user
      end
      it 'loads correct user details' do
        get :show, params: { id: @user.id }
        expect(assigns(:user)).to eq @user
        expect(response).to be_ok
      end
      it 'cant access other users show page' do
        get :show, params: { id: @user2.id }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end      
    end

    context 'when a user is not logged in' do
      it 'redirects to login' do
        get :show, params: { id: @user.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

  end
end