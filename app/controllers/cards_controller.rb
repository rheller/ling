class CardsController < ApplicationController
  def new
    @card = Card.new


    #tk need algorithm, make efficient 'RAND()' in postgreg
    @original = Word.where(language_id: current_user.from_language_id).order('Random()').first 
    meaning_id = @original.meaning_id
    @translation = Word.where(language_id: current_user.to_language_id, meaning_id: meaning_id).first
#  tk make more efficient
    @distractors = Word.where.not(meaning_id: meaning_id).where(language_id: current_user.to_language_id).limit(2)

logger.info "tk original " + @original.inspect
logger.info "tk translation " + @translation.inspect
logger.info "tk distractor" + @distractors.inspect

  end

  def create

    redirect_to new_card_path
  end

end
