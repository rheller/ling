class Admin::WordsController < AdminsController

  def index
    @words = Word.all
  end
  
  def import
    Word.import(params[:file])
    redirect_to root_url, notice: "Words imported."
  end

end
