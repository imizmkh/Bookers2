class BooksController < ApplicationController
  
  def new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:success] = 'You have created book successfully.'
      redirect_to book_path(@book)
    else
      render :new
    end
  end
  
  def index
    @book = Book.new
    @books = Book.all
  end
  
  def show
    @book = Book.new
    @books = Book.all
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  def edit
     @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    flash[:success] = 'You have update book successfully.'
    redirect_to book_path(@book.id)
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title,:body)
  end
  
end
