class CreateMeanings < ActiveRecord::Migration
  def change
    create_table :meanings do |t|
      t.string   :denotation
      t.timestamps
    end
  end
end
