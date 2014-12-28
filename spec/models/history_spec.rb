require 'rails_helper'

RSpec.describe History, :type => :model do
 it { should belong_to(:user) }
 it { should belong_to(:word) }
end
