class ChangeStories < ActiveRecord::Migration
  def change
    change_table :stories do |t|
      t.remove :contributor_id
    end
  end
end
