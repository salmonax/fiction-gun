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

    context 'with invalid parameters' do
      let(:invalid_attributes) {{:email => "", :password => "", :password_confirmation => '', :pen_name => ''}}
      let(:invalid_parameters) {{:user => invalid_attributes}}
 
      before {post :create, invalid_parameters}
      it {should set_the_flash[:alert]}
      it {should render_template :new}
    end
  end

context 'GET index' do
  before {get :index}

  it {should render_template :index}
end

#   context 'GET edit' do
#     let(:article) {FactoryGirl.create :article}
#     before {get :edit, {:id => article.id}, {'user_id' => user.id}}

#     it {should render_template :edit}
#   end

#   context 'PUT update' do
#     let(:article) {FactoryGirl.create :article}

#     context 'with valid parameters' do 
#       let(:valid_attributes) {{title: "fish who lie"}}
#       let(:valid_parameters) {{id: article.id, article: valid_attributes}}
#       before {put :update, valid_parameters, 'user_id' => user.id}

#       it 'updates the article' do
#         Article.find(article.id).title.should eq valid_attributes[:title]
#       end

#       it {should redirect_to action: "index"}
#     end

#     context 'with invalid parameters' do
#       let(:invalid_attributes) {{title: ''}}
#       let(:invalid_parameters) {{id: article.id, article: invalid_attributes}}
#       before {put :update, invalid_parameters, 'user_id' => user.id}

#       it {should render_template :edit}
#       it {should set_the_flash[:alert]}
#     end
#   end

#   context 'DELETE destroy' do 
#     it 'destroys an article' do 
#       article = FactoryGirl.create :article
#       expect {delete :destroy, {:id => article.id}, 'user_id' => user.id}.to change(Article, :count).by(-1)
#     end
#   end



end