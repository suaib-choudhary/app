class BooksController < ApplicationController
  def index

    @books = Book.where(author_id: params[:author_id])
    respond_to do |format|
      format.js {render layout: false}
    end
  end

  def new
    @book= Book.new
    @authors = Author.all
    respond_to do |format|
      format.js{render layout: false }
    end
  end

  def create
    @book= Book.new(book_params)
    if @book.save
      redirect_to books_path()
    else
      @authors = Author.all
      render :new
    end
  end

  def show
    @book= Book.find(params[:id])
  
  end

  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
      redirect_to authors_path
    else
      render :edit
    end

  end

  def destroy
    @book= Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:name,:author_id)
  end

end
