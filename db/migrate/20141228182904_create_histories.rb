class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.integer  "user_id"
      t.integer  "word_id"
      t.integer  "tries", default: 0
      t.integer  "successes", default: 0
      t.timestamps
    end
  end
end
