require 'rails_helper'

RSpec.describe History, :type => :model do
 it { should belong_to(:user) }
 it { should belong_to(:word) }

   describe "#repeat_rate" do
    it "should calculate the repeat rate" do
      history = Fabricate(:history, tries: 10, successes: 5)
      expect(History.first.repeat_rate).to eq(2 * History::REPEAT_RATE_AMPLIFIER) 
    end

    it "should handle the 0 success case" do
      history = Fabricate(:history, tries: 10, successes: 0)
      expect(History.first.repeat_rate).to eq(History::REPEAT_RATE_FOR_ALL_WRONG)
    end

  end
end
