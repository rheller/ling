class CardsController < ApplicationController
  def new
    @card = Card.new


    #tk need algorithm, make efficient 'RAND()' in postgreg
    @original = Word.where(language_id: current_user.from_language_id).order('Random()').first 
    meaning_id = @original.meaning_id
    @translation = Word.where(language_id: current_user.to_language_id, meaning_id: meaning_id).first
#  tk make more efficient
    @distractors = Word.where.not(meaning_id: meaning_id).where(language_id: current_user.to_language_id).limit(2)
  end

  def create
    @card = Card.new(card_params)
    @card.user_id = current_user.id
    @card.save
    redirect_to new_card_path
  end


private
  def card_params
     params.require(:card).permit(:original_id, :translation_id, :chosen_id, :distractor1_id, :distractor2_id)
  end

end
