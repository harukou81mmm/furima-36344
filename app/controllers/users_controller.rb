class UsersController < ApplicationController

  def edit
  end

  def new
    @user = User.new 
  end
  
  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

end
