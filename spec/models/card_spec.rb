require 'rails_helper'

RSpec.describe Card, :type => :model do
    it { should belong_to(:user) }
    it { should belong_to(:original) }
    it { should belong_to(:translation) }
end
