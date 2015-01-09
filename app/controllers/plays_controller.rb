class PlaysController < ApplicationController
  before_action :set_play, only: [:show, :edit, :update, :destroy]

  respond_to :html


  def index

    if current_user.from_language_id.blank? ||
       current_user.to_language_id.blank?
       redirect_to edit_user_path(current_user)
    else
      @play = Play.new
      Word.uncached do #to avoid caching random query
        # some words may not have translations loaded
        #keep looping until a full card is assembled
        200.times do
          break if assemble_play.present?
        end
      end
      raise StandardError unless @choices.present? #tk
    end

    @play.original_id = @original.id
    @play.translation_id = @translation.id
    @play.distractor1_id = @distractors[0].id
    @play.distractor2_id = @distractors[1].id
    @play.save
    @plays = [@play]
logger.info "tk rick plays are " + @plays.inspect

    respond_to do |format|
    #   format.json { render json: @plays }
       format.json {  }
    end
  end

  def show
    respond_with(@play)
  end

  def new
    @play = Play.new
    respond_with(@play)
  end

  def edit
  end

  def create
  end

  def update
logger.info "tk staring crated"
    @card = Play.new(play_params)
    @card.user_id = current_user.id
    @card.save
logger.info "tk card saved"

    correct = (@card.chosen_id == @card.translation_id)

    if current_user.premium?
      history = History.where(user_id: @card.user_id, word_id: @card.original_id).first_or_create
      history.tries += 1
      history.successes += 1 if correct
      history.save
    end

logger.info "tk ab out to check for original spelling"

    word_pair =  @card.original.spelling + ' is ' + @card.translation.spelling

logger.info "tk about to respond" + card.inspect

    respond_to do |format|
      if correct
logger.info "tk repsonding with corect"
        format.json { render json: @card }
      else
logger.info "tk repsonding with INcorect"
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end



    # if correct
    #   flash[:success] = 'Correct! ' + word_pair
    # else
    #   flash[:danger] = 'Sorry! The correct translation for ' + word_pair
    # end

    # redirect_to new_card_path
  end






  #tk def update
  #tk   @play.update(play_params)
  #tk   respond_with(@play)
 #tk  end

  def destroy
    @play.destroy
    respond_with(@play)
  end

  private
    def set_play
      @play = Play.find(params[:id])
    end

  def assemble_play
    @original = Word.next_word_for(current_user)
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

def play_params
    params.require(:play).permit(:original_spelling, :choice0, :choice1, :choice2, :success_rate, :play_id)
  end

end
