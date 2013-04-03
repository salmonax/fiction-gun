require 'spec_helper'

describe UsersController do
  context 'routing' do
    it {should route(:get, '/users/new').to :action => :new}    
    it {should route(:post, '/users').to :action => :create}
    it {should route(:put, '/users/1').to :action => :update, :id => 1}
    it {should route(:delete, '/users/1').to :action => :destroy, :id => 1}
    it {should route(:get, '/users').to :action => :index}
    it {should route(:get, '/users/1').to :action => :show, :id => 1}
    it {should route(:get, '/users/1/edit').to :action => :edit, :id =>1}
  end

  context 'GET new' do
    before {get :new}

    it {should render_template :new}
  end

  context 'POST create' do 
    context 'with valid parameters' do
      let(:valid_attributes) {{:email => "plowry@scu.edu", :password => "abc1234", :password_confirmation => 'abc1234', :pen_name => 'plowry'}}
      let(:valid_parameters) {{:user => valid_attributes}}

      it 'creates a new user' do
        expect {post :create, valid_parameters}.to change(User, :count).by(1) 
      end
      context 'before create' do 
        before {post :create, valid_parameters}
        it {should redirect_to users_path}
        it {should set_the_flash[:notice]}
      end
    end 
  end    
end