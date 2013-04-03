require 'spec_helper'

describe StoriesController do

  let(:valid_attributes) {{ :title => 'story of greatness', :text => 'one upon there was a dinosaur. then it died. the end.', :contributor_id => 1, :genre_id => 1}}
  let(:valid_parameters) {{:story => valid_attributes}}


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
    before {get :new}
    it {should render_template :new}
  end

  context 'POST create' do
    context 'with valid parameters' do
      it 'creates a new story' do
        expect {post :create, valid_parameters}.to change(Story, :count).by(1)
      end

      before {post :create, valid_parameters}
      it {should redirect_to new_story_path}
      it {should set_the_flash[:notice]}
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) {{:title => ''}}
      let(:invalid_parameters) {{:story => invalid_attributes}}
      before {post :create, invalid_parameters}

      it {should render_template :new}
    end
  end

end