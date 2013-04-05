require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe SimplePromptsController do

  # This should return the minimal set of attributes required to create a valid
  # SimplePrompt. As you add validations to SimplePrompt, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "text" => "MyString" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SimplePromptsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all simple_prompts as @simple_prompts" do
      simple_prompt = SimplePrompt.create! valid_attributes
      get :index, {}, valid_session
      assigns(:simple_prompts).should eq([simple_prompt])
    end
  end

  describe "GET show" do
    it "assigns the requested simple_prompt as @simple_prompt" do
      simple_prompt = SimplePrompt.create! valid_attributes
      get :show, {:id => simple_prompt.to_param}, valid_session
      assigns(:simple_prompt).should eq(simple_prompt)
    end
  end

  describe "GET new" do
    it "assigns a new simple_prompt as @simple_prompt" do
      get :new, {}, valid_session
      assigns(:simple_prompt).should be_a_new(SimplePrompt)
    end
  end

  describe "GET edit" do
    it "assigns the requested simple_prompt as @simple_prompt" do
      simple_prompt = SimplePrompt.create! valid_attributes
      get :edit, {:id => simple_prompt.to_param}, valid_session
      assigns(:simple_prompt).should eq(simple_prompt)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new SimplePrompt" do
        expect {
          post :create, {:simple_prompt => valid_attributes}, valid_session
        }.to change(SimplePrompt, :count).by(1)
      end

      it "assigns a newly created simple_prompt as @simple_prompt" do
        post :create, {:simple_prompt => valid_attributes}, valid_session
        assigns(:simple_prompt).should be_a(SimplePrompt)
        assigns(:simple_prompt).should be_persisted
      end

      it "redirects to the created simple_prompt" do
        post :create, {:simple_prompt => valid_attributes}, valid_session
        response.should redirect_to(SimplePrompt.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved simple_prompt as @simple_prompt" do
        # Trigger the behavior that occurs when invalid params are submitted
        SimplePrompt.any_instance.stub(:save).and_return(false)
        post :create, {:simple_prompt => { "text" => "invalid value" }}, valid_session
        assigns(:simple_prompt).should be_a_new(SimplePrompt)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        SimplePrompt.any_instance.stub(:save).and_return(false)
        post :create, {:simple_prompt => { "text" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested simple_prompt" do
        simple_prompt = SimplePrompt.create! valid_attributes
        # Assuming there are no other simple_prompts in the database, this
        # specifies that the SimplePrompt created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        SimplePrompt.any_instance.should_receive(:update_attributes).with({ "text" => "MyString" })
        put :update, {:id => simple_prompt.to_param, :simple_prompt => { "text" => "MyString" }}, valid_session
      end

      it "assigns the requested simple_prompt as @simple_prompt" do
        simple_prompt = SimplePrompt.create! valid_attributes
        put :update, {:id => simple_prompt.to_param, :simple_prompt => valid_attributes}, valid_session
        assigns(:simple_prompt).should eq(simple_prompt)
      end

      it "redirects to the simple_prompt" do
        simple_prompt = SimplePrompt.create! valid_attributes
        put :update, {:id => simple_prompt.to_param, :simple_prompt => valid_attributes}, valid_session
        response.should redirect_to(simple_prompt)
      end
    end

    describe "with invalid params" do
      it "assigns the simple_prompt as @simple_prompt" do
        simple_prompt = SimplePrompt.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SimplePrompt.any_instance.stub(:save).and_return(false)
        put :update, {:id => simple_prompt.to_param, :simple_prompt => { "text" => "invalid value" }}, valid_session
        assigns(:simple_prompt).should eq(simple_prompt)
      end

      it "re-renders the 'edit' template" do
        simple_prompt = SimplePrompt.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SimplePrompt.any_instance.stub(:save).and_return(false)
        put :update, {:id => simple_prompt.to_param, :simple_prompt => { "text" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested simple_prompt" do
      simple_prompt = SimplePrompt.create! valid_attributes
      expect {
        delete :destroy, {:id => simple_prompt.to_param}, valid_session
      }.to change(SimplePrompt, :count).by(-1)
    end

    it "redirects to the simple_prompts list" do
      simple_prompt = SimplePrompt.create! valid_attributes
      delete :destroy, {:id => simple_prompt.to_param}, valid_session
      response.should redirect_to(simple_prompts_url)
    end
  end

end