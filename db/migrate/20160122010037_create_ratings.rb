class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :user,null:false
      t.integer :rating_id
      t.string :rating_type

      t.text :body,null:false
      t.integer :score,null:false

      t.timestamps null: false
    end
  end
end
