require 'rails_helper'

RSpec.describe Play, :type => :model do
    it { should belong_to(:user) }
    it { should belong_to(:original) }
    it { should belong_to(:translation) }
end
