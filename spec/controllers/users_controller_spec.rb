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

      it 'logs in the new user'

      context 'before create' do 
        before {post :create, valid_parameters}
        it {should redirect_to stories_path}
        it {should set_the_flash[:notice]}
      end
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) {{:email => "", :password => "", :password_confirmation => '', :pen_name => ''}}
      let(:invalid_parameters) {{:user => invalid_attributes}}
 
      before {post :create, invalid_parameters}
      it {should set_the_flash[:alert].to("There were errors").now}
      it {should render_template :new}
    end
  end

  context 'GET index' do
    let(:user) {FactoryGirl.create(:user)}

    context 'with authorized session' do
      before {get :index, {}, {'user_id' => user.id}}
      it {should render_template :index}
    end

    context 'without authorized session' do
      before {get :index, {}, {}}
      it {should redirect_to login_url}
    end
  end

  context 'GET edit' do
    let(:user) {FactoryGirl.create :user}
    before {get :edit, {:id => user.id}, {'user_id' => user.id}}

    it {should render_template :edit}
  end

  context 'PUT update' do
    let(:user) {FactoryGirl.create :user}

    context 'with authorized session' do
      context 'with valid parameters' do 
        let(:valid_attributes) {{:email => user.email, :pen_name => 'new_name', :password => user.password, :password_confirmation => user.password_confirmation}}
        let(:valid_parameters) {{:id => user.id, :user => valid_attributes}}
        before {put :update, valid_parameters, 'user_id' => user.id}

        it 'updates the user attributes' do
          User.find(user.id).pen_name.should eq valid_attributes[:pen_name]
        end

        it {should set_the_flash[:notice].to("Your account was successsfully updated.")}
        it {should redirect_to users_path}
      end

      context 'with invalid parameters' do
        let(:invalid_attributes) {{:email => '', :pen_name => '', :password => '', :password_confirmation => ''}}
        let(:invalid_parameters) {{:id => user.id, :user => invalid_attributes}}
        before {put :update, invalid_parameters, 'user_id' => user.id}

        it {should render_template :edit}
        it {should set_the_flash[:alert].to("There were errors in trying to update your account!").now}
      end
    end

  end

  context 'DELETE destroy' do 

    context 'with authorized session' do
      it 'destroys a user' do
        user = FactoryGirl.create :user
        expect {delete :destroy, {:id => user.id}, 'user_id' => user.id}.to change(User, :count).by(-1)
      end

      let(:user) {FactoryGirl.create(:user)}
      before {delete :destroy, {:id => user.id}, {'user_id' => user.id}}
      it {should redirect_to signup_path}
    end

    context 'without authorized session' do
      
      it 'does not destroy a user' do
        user = FactoryGirl.create(:user)
        expect {delete :destroy, {:id => user.id}, {}}.to change(User, :count).by(0)
      end

      let(:user) {FactoryGirl.create(:user)}

      before {delete :destroy, {:id => user.id}, {}}
      it {should set_the_flash[:alert]}
      it {should redirect_to login_url}
    end

  end

  context 'GET show' do
    context 'with authorized session' do
      it 'shows a specific user with a given id number' do
        user = FactoryGirl.create(:user)
        get :show, {:id => user.id}, {'user_id' => user.id}
        should render_template :show 
      end
    end
  end
end