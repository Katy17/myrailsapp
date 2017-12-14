require 'rails_helper'

describe UsersController, type: :controller do
  before do
    @user = User.create(first_name: "John", last_name: "Smith", email: "j.smith@example.com", password: "xyzxyz")
    @user2 = User.create(first_name: "Suzy", last_name: "Sue", email: "s.sue@example.com", password: "123456")
  end

  describe 'GET #show' do
    context 'when user is logged in' do
      before do
        sign_in @user #authentication with Devise
      end

      it 'loads correct user details' do
        get :show, params: { id: @user.id }
        expect(response).to be_ok #OR have_http_status(200)
        expect(assigns(:user)).to eq @user
      end
    end

    context 'when user is not logged in' do
      it 'redirects to login' do
        get :show, params: { id: @user.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    it 'first user cant have access to the show page of second user and redirects to root path' do
      get :show, params: { id: @user2.id }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end

    