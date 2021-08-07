class UsersController < ApplicationController
  def index
    @users = User.all
    @book = Book.new
    @books = Book.all
  end
  
  def show
    @users = User.all
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.all
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      flash[:success] = 'You have update user successfully.'
      redirect_to user_path(@user.id)
    else
      render :edit
    end
    
  end
    
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
