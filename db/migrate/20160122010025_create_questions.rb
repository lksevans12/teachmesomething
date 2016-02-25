class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :body, null:false
      t.integer :user_id, null:false
      t.integer :post_id

      t.timestamps null: false
    end
  end
end
