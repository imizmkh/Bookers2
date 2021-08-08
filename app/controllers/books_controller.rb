class BooksController < ApplicationController

  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:success] = 'You have created book successfully.'
      redirect_to book_path(@book.id)
    else
      @user = current_user
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
    @book = Book.new
    @books = Book.find(params[:id])
    @user = @books.user
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  def edit
    @book = Book.find(params[:id])
    if @book.user_id == current_user.id
      render :edit
    else
      redirect_to books_path
    end
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
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
