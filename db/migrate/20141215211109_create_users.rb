class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   "email"
      t.string   "full_name"
      t.string   "password_digest"
      t.integer  "from_language_id"
      t.integer  "to_language_id"
      t.boolean  "admin"
      t.boolean  "locked",          default: false
      t.timestamps
    end
  end
end
