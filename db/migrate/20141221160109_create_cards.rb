class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :user_id
      t.integer :word_id
      t.integer :meaning_id
      t.integer :distractor1_id
      t.integer :distractor2_id
      t.integer :chosen_id
      t.boolean :correct
      t.timestamps
    end
  end
end
