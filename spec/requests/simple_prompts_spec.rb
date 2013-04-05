require 'spec_helper'

describe "SimplePrompts" do
  describe "GET /simple_prompts" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get simple_prompts_path
      response.status.should be(200)
    end
  end
end
