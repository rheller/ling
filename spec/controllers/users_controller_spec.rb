require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  let(:hank)  { Fabricate(:user) }

#######################################################

  describe 'GET new' do
    it "generates a new record" do
      get :new
      expect(assigns(:user) ).to be_instance_of(User)
    end
  end


#######################################################
  describe 'POST create' do

    context "successful user sign up" do
   
      it "redirects to sign_in" do
        post :create, user: Fabricate.attributes_for(:user)
        expect(response).to redirect_to sign_in_path
      end

    end

    context "the user sign up is INVALID" do
      it "rerenders the new template" do
        post :create, user: Fabricate.attributes_for(:user, email: nil)
        expect(response).to render_template 'new'
      end

      it "sets the flash message" do
        post :create, user: Fabricate.attributes_for(:user, email: nil)
        expect(flash[:error]).to be_present
      end

    end

  end
##############################################

end
