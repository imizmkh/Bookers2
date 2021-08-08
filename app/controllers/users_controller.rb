class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end
  
  def show
    @users = User.all
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books.page(params[:page]).reverse_order
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:success] = 'You have created book successfully.'
      redirect_to book_path(@book)
    else
      @books = Book.all
      render action: :index
    end
  end
  
  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user.id)
    end
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
