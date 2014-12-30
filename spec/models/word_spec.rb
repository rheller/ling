require 'rails_helper'

RSpec.describe Word, :type => :model do
  it { should belong_to(:language) }
  it { should belong_to(:meaning) }
  it { should have_many(:originals) }
  it { should have_many(:translations) }
  it { should have_many(:histories) }
  it { should have_many(:users) }


#######################################################

  describe ".next_word_for" do

    it "should get a word at random in the absence of history" do
      english = Fabricate(:language)
      hank = Fabricate(:premium_user)
      hank.from_language_id = english.id
      new_word = Fabricate(:word, language: english)
      expect(Word.next_word_for(hank)).to eq(new_word) 
    end

  it "should get a word from history when the success rate is low" 
#tk - how to account for the randomness, given the grace period

  end
#######################################################

end
