class StoriesController < ApplicationController
  before_filter :authorize, only: [:new, :create, :edit, :update, :destroy]

  def new
    @story = current_user.stories.new
  end

  def create
    @story = current_user.stories.new(params[:story])

    if @story.save
      Contribution.create(:story_id => @story.id, :user_id => current_user.id)
      flash[:notice] = "Your story was successfully created! YAY!"
      redirect_to stories_path

    else
      render :new
      flash[:alert] = "Please make sure all fields are filled in and try again."
    end
  end

  def show
    @story = Story.find(params[:id])
  end

  def index
    @stories = Story.all
  end

  def edit
    @story = Story.find(params[:id])
  end

  def update
    @story = Story.find(params[:id])
    if @story.update_attributes(params[:story])
      flash[:notice] = "Your contact was successfully updated! WOO!"
      redirect_to story_path
    else
      render :edit
    end
  end

  def destroy
    @story = Story.find(params[:id])
    @story.destroy
    flash[:notice] = "Your story was successfully deleted."
    redirect_to stories_path
  end

end
