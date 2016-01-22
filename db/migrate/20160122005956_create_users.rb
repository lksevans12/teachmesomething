class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null:false
      t.string :usernme, null:false
      t.string :password_digest, null:false
      t.string :website
      t.string :facebook
      t.string :about, null:false

      t.timestamps null: false
    end
  end
end
