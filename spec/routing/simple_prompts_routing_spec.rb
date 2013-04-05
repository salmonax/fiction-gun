require "spec_helper"

describe SimplePromptsController do
  describe "routing" do

    it "routes to #index" do
      get("/simple_prompts").should route_to("simple_prompts#index")
    end

    it "routes to #new" do
      get("/simple_prompts/new").should route_to("simple_prompts#new")
    end

    it "routes to #show" do
      get("/simple_prompts/1").should route_to("simple_prompts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/simple_prompts/1/edit").should route_to("simple_prompts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/simple_prompts").should route_to("simple_prompts#create")
    end

    it "routes to #update" do
      put("/simple_prompts/1").should route_to("simple_prompts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/simple_prompts/1").should route_to("simple_prompts#destroy", :id => "1")
    end

  end
end
