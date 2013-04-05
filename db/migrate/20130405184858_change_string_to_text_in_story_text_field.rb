class ChangeStringToTextInStoryTextField < ActiveRecord::Migration
  def change
    change_column :stories, :text, :text
  end
end
