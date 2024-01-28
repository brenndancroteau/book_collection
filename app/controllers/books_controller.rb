class BooksController < ApplicationController

  def index
    @books = Book.order(:price)
  end

  def new
    @book = Book.new()
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path, notice: "Book Created Successfully!"
    else
      redirect_to books_path, alert: "Failed to Add Book."
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to books_path, notice: "Book Modified Successfully!"
    else
      redirect_to books_path, alert: "Failed to Modify Book."
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def delete
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: "Book Deleted Successfully!"
  end

  private

  def book_params
    params.require(:book).permit(
      :title, 
      :author, 
      :price, 
      :published
      )
  end

end