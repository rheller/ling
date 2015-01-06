require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  let(:hank)  { Fabricate(:user) }

  describe 'GET edit' do
    it "should allow the user to edit certain fields"
  end

  describe 'POST update' do
    it "should update certain fields edited by the user"
  end

end
