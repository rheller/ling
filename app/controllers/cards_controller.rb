class CardsController < ApplicationController
  before_filter :authenticate_user!

  def new
    #force new user to pick languages
    if current_user.from_language_id.blank? ||
       current_user.to_language_id.blank?
       redirect_to edit_user_path(current_user)
    end
  end

end
