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

      it 'should set the session to the user id' do 
        post :create, {:email => user.email, :password => user.password}
        should set_session(:user_id).to(user.id)
      end

      it 'should set the session to the user id' do 
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
end
