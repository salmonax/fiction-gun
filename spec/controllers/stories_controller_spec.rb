require 'spec_helper'

describe StoriesController do
  let(:story) {FactoryGirl.create :story}
  let(:user) {FactoryGirl.create :user}
  let(:valid_attributes) {{ :title => 'story of greatness', :text => 'one upon there was a dinosaur. then it died. the end.', :genre_id => 1}}
  let(:valid_parameters) {{:story => valid_attributes, :id => story.id}}
  let(:invalid_attributes) {{:title => ''}}
  let(:invalid_parameters) {{:story => invalid_attributes, :id => story.id}}

  context 'routing' do
    it {should route(:get, '/stories/new').to :action => :new}
    it {should route(:post, '/stories').to :action => :create}
    it {should route(:get, '/stories/1').to :action => :show, :id => 1}
    it {should route(:get, '/stories/1/edit').to :action => :edit, :id => 1}
    it {should route(:put, '/stories/1').to :action => :update, :id => 1}
    it {should route(:delete, '/stories/1').to :action => :destroy, :id => 1}
    it {should route(:get, '/stories').to :action => :index}
  end

  context 'GET new' do
    before {get :new, {}, {'user_id' => user.id}}
    it {should render_template :new}
  end

  context 'POST create' do
    context 'with valid parameters' do
      it 'creates a new story' do
        expect {post :create, valid_parameters, {'user_id' => user.id}}.to change(Story, :count).by(1)
      end

      before {post :create, valid_parameters, {'user_id' => user.id}}
      it {should redirect_to stories_path}
      it {should set_the_flash[:notice]}
    end

    context 'with invalid parameters' do
      before {post :create, invalid_parameters, {'user_id' => user.id}}

      it {should render_template :new}
    end
  end

  context 'GET index' do
    before {get :index}

    it {should render_template :index}
  end

  context 'GET edit' do
    context 'with authorized session' do
      before {get :edit, {:id => story.id}, {'user_id' => user.id}}
      it {should render_template :edit}
    end

    context 'without authorized session' do
      before {get :edit, {:id => story.id}, {}}
      it {should redirect_to login_path}
      it {should set_the_flash[:alert]}
    end
  end

  context 'PUT update' do
    context 'with valid parameters' do
      before {put :update, valid_parameters, {'user_id' => user.id}}

      it 'updates the story' do
        Story.find(story.id).title.should eq valid_attributes[:title]
      end

      it {should redirect_to story_path}
      it {should set_the_flash[:notice]}
    end

    context 'with invalid parameters' do
      before {put :update, invalid_parameters, {'user_id' => user.id}}

      it {should render_template :edit}
    end
  end

  context 'GET show' do
    before {get :show, {:id => story.id}}

    it {should render_template :show}
  end

  context 'DELETE destroy' do
    it 'destroys a story' do
      factory_story = FactoryGirl.create :story 
      expect {delete :destroy, {:id => factory_story.id}, {'user_id' => user.id}}.to change(Story, :count).by(-1)
    end

    before {delete :destroy, {:id => story.id}, {'user_id' => user.id}}

    it {should redirect_to stories_path}
    it {should set_the_flash[:notice]}
  end
end