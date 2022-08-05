# frozen_string_literal: true

class AuthorsController < ApplicationController
  before_action :set_author, only: %i[show edit update destroy]

  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to authors_url
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @author.update(author_params)
      redirect_to @author
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @author.books.destroy
    @author.destroy
    redirect_to authors_path(@author), status: 303
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_author
    @author = Author.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def author_params
    params.require(:author).permit(:name)
  end
end
