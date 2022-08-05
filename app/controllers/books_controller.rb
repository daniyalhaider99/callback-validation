# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]

  def new
    @book = Book.new
  end

  def create
    @author = Author.find(params[:author_id])
    @book = @author.books.create(book_params)
    redirect_to author_books_path(@book)
  end

  def show; end

  def destroy
    @book.destroy
    redirect_to author_path(@book.author_id), status: 303
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def book_params
    params.require(:book).permit(:name, :published_at, :author_id)
  end
end
