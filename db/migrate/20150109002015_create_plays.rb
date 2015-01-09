class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.integer :user_id
      t.integer :original_id
      t.integer :translation_id
      t.integer :distractor1_id
      t.integer :distractor2_id
      t.integer :chosen_id
      t.timestamps
    end
  end
end
