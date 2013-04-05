require 'spec_helper'

describe SimplePrompt do
  it {should validate_presence_of :text}
  it {should ensure_length_of(:text).is_at_least(10).is_at_most(140)}
  it {should belong_to :user}
end
