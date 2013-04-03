class StoriesController < ApplicationController

  def new
    #@story = Story.new
  end

  def create
    @story = Story.new(params[:story])

    if @story.save
      flash[:notice] = "Your story was successfully created! YAY!"
      redirect_to new_story_path

    else
      render :new
      flash[:alert] = "Please make sure all fields are filled in and try again."
    end
  end

end
