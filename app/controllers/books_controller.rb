class BooksController < ApplicationController
  
  def new
     @book = Book.new
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
  
  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end
  
  def show
    @new_book = Book.new
    @book = Book.find(params[:id])
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
    if @book.save
      flash[:success] = 'You have update book successfully.'
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title,:body)
  end
  
end
