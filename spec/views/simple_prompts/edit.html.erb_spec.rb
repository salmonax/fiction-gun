require 'spec_helper'

describe "simple_prompts/edit" do
  before(:each) do
    @simple_prompt = assign(:simple_prompt, stub_model(SimplePrompt,
      :text => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit simple_prompt form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", simple_prompt_path(@simple_prompt), "post" do
      assert_select "input#simple_prompt_text[name=?]", "simple_prompt[text]"
      assert_select "input#simple_prompt_user_id[name=?]", "simple_prompt[user_id]"
    end
  end
end
