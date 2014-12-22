require 'rails_helper'

RSpec.describe CardsController, :type => :controller do

#######################################################
  describe 'GET new' do

#    let(:hank) {current_user} 
#    let(:meaning)  { Fabricate(:meaning) }
#    let(:translation)  { Fabricate(:word) }

      before do
        @english = Fabricate(:language)
        @japanese = Fabricate(:language)

        @hank = Fabricate(:user, from_language_id: @english.id, to_language_id: @japanese.id)
        set_current_user(@hank)

        @meaning   = Fabricate(:meaning)
        @english_word = Fabricate(:word, meaning: @meaning, language: @english)
        @japanese_word = Fabricate(:word, meaning: @meaning, language: @japanese)
      end

    it "generates a new record" do
      get :new
      expect(assigns(:card)).to be_instance_of(Card)
    end

    it "generates a word to translate" do
      get :new
      expect(assigns(:original)).to be_present
    end

    it "generates a translation" do
      get :new
      expect(assigns(:translation)).to be_present
    end

  end
#######################################################

end
