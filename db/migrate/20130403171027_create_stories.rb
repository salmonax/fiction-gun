class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.column :title, :string
      t.column :text, :string
      t.column :contributor_id, :integer
      t.column :genre_id, :integer
    end
  end
end
