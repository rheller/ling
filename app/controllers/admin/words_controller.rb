class Admin::WordsController < AdminsController

  def index
    @words = Word.all
  end

end
