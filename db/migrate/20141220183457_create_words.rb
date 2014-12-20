class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string  :spelling
      t.integer :meaning_id
      t.integer :language_id
      t.timestamps
    end
  end
end
