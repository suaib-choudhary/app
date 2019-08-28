class AuthorsController < ApplicationController
  before_action :set_author, except: [:index, :create]

  
  def index
    @authors = Author.all
  end

  def new
    respond_to do |format|
      format.js{render layout: false}
    end
  end

  def create
    @author= Author.new(author_params)
    if @author.save
      redirect_to authors_path
    else
      render :new
    end

  end

  def show
    respond_to do |format|
      format.js { render layout: false } 
    end
  end

  # def edit
  # end

  def update
    if @author.update(author_params)
      redirect_to authors_path
    else
      render :edit
    end
  end

  def destroy
    @author.destroy
    redirect_to authors_path
  end

  private
  def set_author
    @author = if params[:id].present?
      Author.find(params[:id])
    else
      Author.new
    end
  end

  def author_params
    params.require(:author).permit(:name, :contact)
  end

end
