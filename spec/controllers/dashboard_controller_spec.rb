require 'spec_helper'

describe DashboardController do
  context 'routing'

  it {should route(:get, '/dashboard').to :action => :index}

  context 'GET index' do
    context 'with_current_user' do
      let(:user) {FactoryGirl.create :user}

      before {get :index, {}, 'user_id' => user.id}
      it {should render_template :index}      
    end

    context 'without_current_user' do
      before {get :index}
      it {should redirect_to stories_path}
    end

  end

end