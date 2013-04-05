require 'spec_helper'

describe "simple_prompts/show" do
  before(:each) do
    @simple_prompt = assign(:simple_prompt, stub_model(SimplePrompt,
      :text => "Text",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Text/)
    rendered.should match(/1/)
  end
end
