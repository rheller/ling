require 'rails_helper'

RSpec.describe Language, :type => :model do
  it { should have_many(:words) }
end
