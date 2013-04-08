class DashboardController < ApplicationController

  def index
    if current_user
      @dashboard = Dashboard.new(current_user)
      render :index
    else
      @stories = Story.all
      redirect_to stories_path
    end
  end

end