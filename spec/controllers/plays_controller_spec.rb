require 'rails_helper'

RSpec.describe PlaysController, :type => :controller do

#######################################################
  describe 'GET show' do

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
      get :show, id: 1, :format => :json
      expect(assigns(:play)).to be_instance_of(Play)
    end

    it "generates a word to translate" do
      get :show, id: 1, :format => :json
      expect(assigns(:original)).to be_present
    end

    it "generates a translation" do
      get :show, id:1, :format => :json
      expect(assigns(:translation)).to be_present
    end

    it "produces two distractor words" do
      get :show, id: 1, :format => :json
      expect(assigns(:distractors).count).to eq(2)
    end

    it "produces distractors that do not the real translation"  do
      get :show, id:1,  :format => :json
      expect(assigns(:distractors).include? @japanese_word).to eq(false)
    end


    #tk it "presents the choices in random order"

  end
#######################################################

  describe 'PUT update' do
    before do
     @english = Fabricate(:language)
     @japanese = Fabricate(:language)
    end

    it "should update the play " do
      @card   = Fabricate(:play)
      set_current_user
      put :update, id: @card.id, play: Fabricate.attributes_for(:play).merge!({play_id: @card.id, success_rate: @card.translation.spelling}), :format => :json
      expect(Play.first.chosen_id).to eq(Play.first.translation_id)
    end

    it "should save the user who updated the play " do
      @card   = Fabricate(:play)
      set_current_user
      put :update, id: @card.id, play: Fabricate.attributes_for(:play).merge!({play_id: @card.id, success_rate: @card.translation.spelling}), :format => :json
      expect(Play.first.user).to eq(@card.user)
    end

    context "premium users" do
      
      it 'records tries for premium users' do
        @hank = Fabricate(:user, from_language_id: @english.id, to_language_id: @japanese.id, plan: "premium")
        set_current_user(@hank)
        @card   = Fabricate(:play, user: @hank)
        put :update, id: @card.id, play: Fabricate.attributes_for(:play).merge!({play_id: @card.id, success_rate: @card.translation.spelling}), :format => :json
        expect(History.first.tries).to eq(1)
      end

      it 'records successes when correct' do
        @hank = Fabricate(:user, from_language_id: @english.id, to_language_id: @japanese.id, plan: "premium")
        set_current_user(@hank)
        @card   = Fabricate(:play, user: @hank)
        put :update, id: @card.id, play: Fabricate.attributes_for(:play).merge!({play_id: @card.id, success_rate: @card.translation.spelling}), :format => :json
        expect(History.first.successes).to eq(1)
      end

      it 'does not register successes when incorrect' do
        @hank = Fabricate(:user, from_language_id: @english.id, to_language_id: @japanese.id, plan: "premium")
        set_current_user(@hank)
        @card   = Fabricate(:play, user: @hank)
        put :update, id: @card.id, play: Fabricate.attributes_for(:play).merge!({play_id: @card.id, success_rate: @card.distractor1.spelling}), :format => :json
        expect(History.first.successes).to eq(0)
      end
      
    end

    it 'does not record history for basic users' do
      @hank = Fabricate(:user, from_language_id: @english.id, to_language_id: @japanese.id, plan: "basic")
      set_current_user(@hank)
      @card   = Fabricate(:play, user: @hank)
      put :update, id: @card.id, play: Fabricate.attributes_for(:play).merge!({play_id: @card.id, success_rate: @card.distractor1.spelling}), :format => :json
      expect(History.count).to eq(0)
    end

  end


#######################################################

end
