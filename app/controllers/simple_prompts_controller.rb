class SimplePromptsController < ApplicationController
  # GET /simple_prompts
  before_filter :authorize

  def index
    @simple_prompts = SimplePrompt.all
    # render :text => SimplePrompt.all.sample.text
  end

  # GET /simple_prompts/1
  def show
    @genres = Genre.all
    @simple_prompt = SimplePrompt.find(params[:id])
    @story = current_user.stories.new(:title => "Prompted by: #{@simple_prompt.text}") 
  end

  # GET /simple_prompts/new
  def new
    @simple_prompt = current_user.simple_prompts.new

  end

  def random

  end

  # GET /simple_prompts/1/edit
  def edit
    @simple_prompt = current_user.simple_prompts.find(params[:id])
  end

  # POST /simple_prompts
  def create
    @simple_prompt = current_user.simple_prompts.new(params[:simple_prompt])
    if @simple_prompt.save
      flash[:notice] = "Your prompt was successfully created! YAY!"
      redirect_to stories_path
    else
      render :new
      flash[:alert] = "Please make sure all fields are filled in and try again."
    end

  end

  # PUT /simple_prompts/1
  def update
    @simple_prompt = current_user.simple_prompts.find(params[:id])
    if @simple_prompt.update_attributes(params[:simple_prompt])
      flash[:notice] = "Your contact was successfully updated! WOO!"
      redirect_to simple_prompt_path
    else
      render :edit
    end
    # date_attributes(params[:simple_prompt])
  end

  # DELETE /simple_prompts/1
  def destroy
    @simple_prompt = current_user.simple_prompts.find(params[:id])
    @simple_prompt.destroy
    flash[:notice] = "Your prompt was successfully deleted."
    redirect_to simple_prompts_path
  end
end
