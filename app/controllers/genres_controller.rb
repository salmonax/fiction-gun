class GenresController < ApplicationController

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(params[:genre])

    if @genre.save
      flash[:notice] = "Your genre was successfully created! YAY!"
      redirect_to new_genre_path

    else
      render :new
      flash[:alert] = "Please make sure all fields are filled in and try again."
    end
  end

  def index
    @genres = Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    flash[:notice] = "Your genre was successfully deleted."
    redirect_to genres_path
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update_attributes(params[:genre])
      flash[:notice] = "Your genre was successfully updated! WOO!"
      redirect_to genre_path
    else
      render :edit
    end
  end

end
