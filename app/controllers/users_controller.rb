class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def show
    @books = Book.all
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:success] = 'You have update user successfully.'
    redirect_to user_path(@user.id)
  end
    
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
