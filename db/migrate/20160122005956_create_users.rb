class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null:false
      t.string :username, null:false
      t.string :password_digest, null:false
      t.boolean :teacher, null:false
      t.string :website
      t.string :facebook
      t.string :experience, null:false
      t.string :about

      t.timestamps null: false
    end
  end
end
