require 'rails_helper'

RSpec.describe User, :type => :model do
  it { should have_secure_password }
 it { should have_many(:cards) }

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:full_name) }
end
