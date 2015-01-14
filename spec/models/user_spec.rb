require 'rails_helper'

RSpec.describe User, :type => :model do
  it { should have_many(:plays) }
  it { should have_many(:histories) }
  it { should have_many(:words) }

  it { should validate_presence_of(:email) }

  describe "#premium?" do
    it "should return true if the user is premium" do
      user = Fabricate(:premium_user)
      expect(User.first.premium?).to eq(true) 
    end

    it "should return false if the user is basic" do
      user = Fabricate(:user)
      expect(User.first.premium?).to eq(false) 
    end
  end

end
