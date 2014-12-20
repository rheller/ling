require 'rails_helper'

RSpec.describe Meaning, :type => :model do
  it { should have_many(:words) }
end
