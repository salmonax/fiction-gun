class CreateSimplePrompts < ActiveRecord::Migration
  def change
    create_table :simple_prompts do |t|
      t.string :text
      t.integer :user_id

      t.timestamps
    end
  end
end
