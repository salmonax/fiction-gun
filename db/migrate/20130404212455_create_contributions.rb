class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.integer :user_id
      t.integer :story_id

      t.timestamps
    end
  end
end
