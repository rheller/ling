class CardsController < ApplicationController
  def new
    @card = Card.new
    Word.uncached do #to avoid caching random query
      # some words may not have translations loaded
      #keep looping until a full card is assembled
      200.times do
        break if assemble_card.present?
      end
    end
    raise StandardError unless @choices.present? #tk
  end

  def create
    @card = Card.new(card_params)
    @card.user_id = current_user.id
    @card.save
    if @card.chosen_id == @card.translation_id
      flash[:success] = 'Correct!'
    else
      flash[:danger] = 'Sorry! The correct translation for ' + @card.original.spelling + ' is ' + @card.translation.spelling
    end
    redirect_to new_card_path
  end


private

  def assemble_card
        #tk need algorithm, make efficient 'RAND()' in postgreg
    @original = Word.where(language_id: current_user.from_language_id).order('Random()').first 
    if @original.present?
      meaning_id = @original.meaning_id
      if meaning_id.present?
        @translation = Word.where(language_id: current_user.to_language_id, meaning_id: meaning_id).first 
        if @translation.present?
    #  tk make more efficient
          @distractors = Word.where.not(meaning_id: meaning_id).where(language_id: current_user.to_language_id).order('Random()').limit(2) 
          @choices = (@distractors + [@translation] ).shuffle
        end    
      end
    end
    @choices
  end

  def card_params
     params.require(:card).permit(:original_id, :translation_id, :chosen_id, :distractor1_id, :distractor2_id)
  end

end
