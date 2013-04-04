require 'spec_helper'

describe SessionsController do

  context "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  let(:user) {FactoryGirl.create :user}

  context "POST create" do 
    context 'with valid parameters' do
      it 'sets the session to the user id' do 
        post :create, {:email => user.email, :password => user.password}
        should set_session(:user_id).to(user.id)
      end

      it 'redirects to the users index' do 
        post :create, {:email => user.email, :password => user.password}
        should redirect_to users_path
      end
    end

    context 'with invalid parameters' do 
      before {post :create, {:email => user.email, :password => 'lkjsdf'}}
      it {should_not set_session(:user_id)}
      it {should set_the_flash[:alert].to("Email or password is invalid.").now}
      it {should render_template :new}
    end
  end

  context "DELETE destroy" do 
    it 'destroys the session (or logs out the user if you prefer)' do 
      delete :destroy, {:user_id => user.id}
      session[:user_id].should be_nil
    end
    before {delete :destroy, {:user_id => user.id}}
    it {should redirect_to login_path}
    it {should set_the_flash[:notice].to("Logged out!")}
  end
end
