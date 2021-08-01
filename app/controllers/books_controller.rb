class BooksController < ApplicationController
  
  def new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end
  
  def index
    @book = Book.new
    @books = Book.all
    @user = User.all
  end
  
  def show
    @book = Book.find(params[:id])
    book = book.all
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to user_url(current_user.id)
  end
  
  def edit
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title,:body)
  end
  
end
