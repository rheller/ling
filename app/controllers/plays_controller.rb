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




    # respond_to do |format|
    #   format.json { render json: @plays }
    # end
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
    @play = Play.new(play_params)
    @play.save
    respond_with(@play)
  end

  def update
    @play.update(play_params)
    respond_with(@play)
  end

  def destroy
    @play.destroy
    respond_with(@play)
  end

  private
    def set_play
      @play = Play.find(params[:id])
    end

    def play_params
      params[:play]
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


end
