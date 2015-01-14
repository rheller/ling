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

    it "should get the whole range of words when run many times " do
      english = Fabricate(:language)
      hank = Fabricate(:premium_user)
      hank.from_language_id = english.id
      Fabricate(:word, language: english)
      Fabricate(:word, language: english)
      Fabricate(:word, language: english)
      words = []
      100.times do
        words << Word.next_word_for(hank)
      end
#its conceivable that one in a while, 100 random tries will find
#just two of the three words, but that should be extremely rare
      expect(words.uniq.count).to eq(3) 
    end

  it "should get a word from history when the success rate is low" 

  end
#######################################################

end
