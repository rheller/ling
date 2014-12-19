require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

  describe "GET new" do
    it "displays sign in page for non-logged in user" do
      get :new
      expect(response).to render_template :new
    end

    it "redirects to home for logged-in user" do
      set_current_user
      @user = current_user
      get :new
      expect(response).to redirect_to home_path
    end
  end

  describe 'POST create' do
    context "sign in is valid" do

      before do
        @user = Fabricate(:user)
        post :create, email: @user.email, password: @user.password
      end

      it "signs in a user from valid data" do
        expect(session[:user_id]).to eq(@user.id)
      end

      it "redirects to home" do
        expect(response).to redirect_to home_path
      end

      it "sets the notice" do
        expect(flash[:notice]).to_not be_blank
      end

    end

    context "sign in is INVALID" do

      before do
        post :create, email: "", password: ""
      end

      it "generates NO session from INVALID data" do
        expect(session[:user_id]).to be_blank
      end

      it "redirects to sign in" do
        expect(response).to redirect_to sign_in_path
      end

      it "sets the error" do
        expect(flash[:error]).to_not be_blank
      end

    end
  end
#####################################
  describe 'GET sign_out' do

      before do
        @user = Fabricate(:user)
#sign in the user
        post :create, email: @user.email, password: @user.password
        get :destroy
      end

      it "destroys the session" do
        expect(session[:user_id]).to be_blank
      end
 
      it "redirects to front page" do
        expect(response).to redirect_to root_path
      end

      it "sets the notice" do
        expect(flash[:notice]).to_not be_blank
      end

  end

end
