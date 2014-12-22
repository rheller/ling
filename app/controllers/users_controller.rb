class UsersController < ApplicationController
 before_filter :logged_in?, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    @user.from_language_id = Language.first.id #tk
    @user.to_language_id = Language.last.id #tk
    response = @user.save
    if response
      flash[:success] = "Thank you for registering. Please sign in."
      redirect_to sign_in_path
    else
      flash[:error] = "Please retry"
      render "new"
    end

  end
  

  def user_params
     params.require(:user).permit(:email, :full_name, :password)
  end

  
end
