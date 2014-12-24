require 'rails_helper'

RSpec.describe CardsController, :type => :controller do

#######################################################
  describe 'GET new' do

      before do
        @english = Fabricate(:language)
        @japanese = Fabricate(:language)

        @hank = Fabricate(:user, from_language_id: @english.id, to_language_id: @japanese.id)
        set_current_user(@hank)

        @meaning   = Fabricate(:meaning)
        @meaning2   = Fabricate(:meaning)
        @meaning3   = Fabricate(:meaning)
        @meaning4   = Fabricate(:meaning)

        @english_word = Fabricate(:word, meaning: @meaning, language: @english)
        @japanese_word = Fabricate(:word, meaning: @meaning, language: @japanese)
        @distractor1 = Fabricate(:word, meaning: @meaning2, language: @japanese)
        @distractor2 = Fabricate(:word, meaning: @meaning3, language: @japanese)
        @distractor3 = Fabricate(:word, meaning: @meaning4, language: @japanese)
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

    it "produces two distractor words" do
      get :new
      expect(assigns(:distractors).count).to eq(2)
    end

    it "produces distractor that do not mean the original word" 


  end
#######################################################

  describe 'POST create' do
    it "should save the card " do
      set_current_user
      post :create, card: Fabricate.attributes_for(:card)
      expect(Card.count).to eq(1)
    end

    it "should save the user who created the card " do
      hank = set_current_user
      post :create, card: Fabricate.attributes_for(:card)
      expect(Card.first.user).to eq(hank)
    end

    it 'should set the success message when the choice is correct' do
      set_current_user
      post :create, card: Fabricate.attributes_for(:card, translation_id: 1, chosen_id: 1)
      expect(flash[:message]).to be_present
    end


    it 'should set the error message when the choice is INcorrect' do
      set_current_user
      post :create, card: Fabricate.attributes_for(:card, translation_id: 1, chosen_id: 2)
      expect(flash[:error]).to be_present
    end




    it "should redirect back to new" do
      set_current_user
      post :create, card: Fabricate.attributes_for(:card)
      expect(response).to redirect_to new_card_path
    end



  end


#######################################################

end
