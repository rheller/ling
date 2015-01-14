class Admin::WordsController < AdminsController

  def index
    @words = Word.meaning_order
  end
  
  def import
    begin
      Word.import(params[:file])
      redirect_to root_url, notice: "Words imported."
    rescue
      redirect_to root_url, notice: "Import Failed!."      
    end
  end

end
