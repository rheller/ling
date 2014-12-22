class CardsController < ApplicationController
  def new
    @card = Card.new

    #tk need algorithm, make efficient 'RAND()' in postgreg
    @original = Word.where(language_id: current_user.from_language_id).order('Random()').first 
    meaning = @original.meaning
    @translation = Word.where(language_id: current_user.to_language_id, meaning: meaning).first
  end
end
