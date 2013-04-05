require 'spec_helper'

describe "simple_prompts/new" do
  before(:each) do
    assign(:simple_prompt, stub_model(SimplePrompt,
      :text => "MyString",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new simple_prompt form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", simple_prompts_path, "post" do
      assert_select "input#simple_prompt_text[name=?]", "simple_prompt[text]"
      assert_select "input#simple_prompt_user_id[name=?]", "simple_prompt[user_id]"
    end
  end
end
