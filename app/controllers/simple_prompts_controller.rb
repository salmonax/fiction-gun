class SimplePromptsController < ApplicationController
  # GET /simple_prompts
  # GET /simple_prompts.json
  def index
    @simple_prompts = SimplePrompt.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @simple_prompts }
    end
  end

  # GET /simple_prompts/1
  # GET /simple_prompts/1.json
  def show
    @simple_prompt = SimplePrompt.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @simple_prompt }
    end
  end

  # GET /simple_prompts/new
  # GET /simple_prompts/new.json
  def new
    @simple_prompt = SimplePrompt.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @simple_prompt }
    end
  end

  # GET /simple_prompts/1/edit
  def edit
    @simple_prompt = SimplePrompt.find(params[:id])
  end

  # POST /simple_prompts
  # POST /simple_prompts.json
  def create
    @simple_prompt = SimplePrompt.new(params[:simple_prompt])

    respond_to do |format|
      if @simple_prompt.save
        format.html { redirect_to @simple_prompt, notice: 'Simple prompt was successfully created.' }
        format.json { render json: @simple_prompt, status: :created, location: @simple_prompt }
      else
        format.html { render action: "new" }
        format.json { render json: @simple_prompt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /simple_prompts/1
  # PUT /simple_prompts/1.json
  def update
    @simple_prompt = SimplePrompt.find(params[:id])

    respond_to do |format|
      if @simple_prompt.update_attributes(params[:simple_prompt])
        format.html { redirect_to @simple_prompt, notice: 'Simple prompt was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @simple_prompt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /simple_prompts/1
  # DELETE /simple_prompts/1.json
  def destroy
    @simple_prompt = SimplePrompt.find(params[:id])
    @simple_prompt.destroy

    respond_to do |format|
      format.html { redirect_to simple_prompts_url }
      format.json { head :no_content }
    end
  end
end
