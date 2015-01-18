class PlaysController < ApplicationController
  before_filter :authenticate_user!


  def show 

    @play = Play.new
    if current_user.from_language_id.present? && current_user.to_language_id.present?
      Word.uncached do #to avoid caching random query
        # some words may not have translations loaded
        #keep looping until a full card is assembled
        200.times do
          break if assemble_play.present?
        end
      end
      raise StandardError unless @choices.present? #tk
    end

    @play.user_id = current_user.id
    @play.original_id = @original.id
    @play.translation_id = @translation.id
    @play.distractor1_id = @distractors[0].id
    @play.distractor2_id = @distractors[1].id
    @play.save
    @plays = [@play]

    respond_to do |format|
       format.json {  }
    end
  end


  def update
# chosen is passed in success rate
    chosen = play_params[:success_rate]
    @card = Play.where(id: play_params[:play_id]).first
    if @card.present?
      correct = (chosen == @card.translation.spelling)
      if correct
        @card.chosen_id = @card.translation_id
      elsif (chosen == @card.distractor1.spelling)
        @card.chosen_id = @card.distractor1_id
      else
        @card.chosen_id = @card.distractor2_id
      end

      @card.save

      if current_user.premium?
        history = History.where(user_id: @card.user_id, word_id: @card.original_id).first_or_create
        history.tries += 1
        history.successes += 1 if correct
        history.save
      end
      word_pair =  @card.original.spelling + ' is ' + @card.translation.spelling
    end

    #save user's last word to that it doesnt get repeted immediately
    current_user.update_attribute(:last_word_id, @card.original_id)

    respond_to do |format|
#return no content so the local ember record is not overwritten
        format.json { head :no_content }
    end

  end



  private


  def assemble_play

    @choices = nil
    @translation = nil
    @distractors = nil

    @original = Word.next_word_for(current_user)
    if @original.present?
      meaning_id = @original.meaning_id
      if meaning_id.present?
        @translation = Word.where(language_id: current_user.to_language_id, meaning_id: meaning_id).first 
        if @translation.present?
          @distractors = Word.where.not(meaning_id: meaning_id).where(language_id: current_user.to_language_id).order('Random()').limit(2) 
          @choices = (@distractors + [@translation] ).shuffle
        end    
      end
    end

    if current_user.last_word.present? && (current_user.last_word.spelling == @original.spelling)
      # if we get the same word twice in a row at random, force another choice
      @choices = nil
    end
    @choices

  end

def play_params
    params.require(:play).permit(:original_spelling, :translation_spelling, :choice0, :choice1, :choice2, :success_rate, :play_id)
  end

end
