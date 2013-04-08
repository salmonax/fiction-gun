class Dashboard

  def initialize(user)
    @user = user
  end

  def stories
    @user.stories
  end

  def user
    @user
  end

end