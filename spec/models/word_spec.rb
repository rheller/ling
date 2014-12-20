require 'rails_helper'

RSpec.describe Word, :type => :model do
  it { should belong_to(:language) }
  it { should belong_to(:meaning) }
end
