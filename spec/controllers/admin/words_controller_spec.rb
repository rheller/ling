require 'rails_helper'

RSpec.describe Admin::WordsController, :type => :controller do

  let(:hank) {current_user} 
    
  describe 'GET index' do

    it_behaves_like "require_admin" do
      let(:action) {get :index}
    end

    it "lists the words" do
      set_current_admin
      Fabricate(:word)
      get :index
      expect(assigns(:words).first).to be_instance_of(Word)
    end
  end

end
