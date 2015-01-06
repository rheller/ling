class UsersController < ApplicationController
 before_filter :authenticate_user!

  def edit
     @user = current_user
  end

  def update
    @user = current_user

    @user.from_language_id = user_params[:from_language_id]
    @user.to_language_id = user_params[:to_language_id]
    @user.full_name = user_params[:full_name]

    @user.save
    redirect_to home_path

  end
  

  def user_params
     params.require(:user).permit(:email, :full_name, :password, :password_confirmation, :to_language_id, :from_language_id)
  end

  
end
