require 'spec_helper'

describe GenresController do
  let(:genre) {FactoryGirl.create :genre}
  let(:valid_attributes) {{:name => 'genre of greatness'}}
  let(:valid_parameters) {{:genre => valid_attributes, :id => genre.id}}
  let(:invalid_attributes) {{:name => ''}}
  let(:invalid_parameters) {{:genre => invalid_attributes, :id => genre.id}}

  context 'routing' do
    it {should route(:get, '/genres/new').to :action => :new}
    it {should route(:post, '/genres').to :action => :create}
    it {should route(:get, '/genres/1').to :action => :show, :id => 1}
    it {should route(:get, '/genres/1/edit').to :action => :edit, :id => 1}
    it {should route(:put, '/genres/1').to :action => :update, :id => 1}
    it {should route(:delete, '/genres/1').to :action => :destroy, :id => 1}
    it {should route(:get, '/genres').to :action => :index}
  end

  context 'GET new' do
    before {get :new}
    it {should render_template :new}
  end

  context 'POST create' do
    context 'with valid parameters' do
      it 'creates a new genre' do
        expect {post :create, valid_parameters}.to change(Genre, :count).by(1)
      end

      before {post :create, valid_parameters}
      it {should redirect_to new_genre_path}
      it {should set_the_flash[:notice]}
    end

    context 'with invalid parameters' do
      before {post :create, invalid_parameters}

      it {should render_template :new}
    end
  end

  context 'GET index' do
    before {get :index}

    it {should render_template :index}
  end

  context 'PUT update' do
    context 'with valid parameters' do
      before {put :update, valid_parameters}

      it 'updates the genre' do
        Genre.find(genre.id).name.should eq valid_attributes[:name]
      end

      it {should redirect_to genre_path}
      it {should set_the_flash[:notice]}
    end

    context 'with invalid parameters' do
      before {put :update, invalid_parameters}

      it {should render_template :edit}
    end
  end

  context 'GET show' do
    before {get :show, {:id => genre.id}}

    it {should render_template :show}
  end

  context 'DELETE destroy' do
    it 'destroys a genre' do
      factory_genre = FactoryGirl.create :genre 
      expect {delete :destroy, {:id => factory_genre.id}}.to change(Genre, :count).by(-1)
    end

    before {delete :destroy, {:id => genre.id}}

    it {should redirect_to genres_path}
    it {should set_the_flash[:notice]}
  end
end