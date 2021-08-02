class BooksController < ApplicationController
  
  def new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:success] = 'You have created book successfully.'
      redirect_to user_path(@user)
    else
      render :new
    end
  end
  
  def index
    @book = Book.new
    @books = Book.all
  end
  
  def show
    @books = Book.all
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
