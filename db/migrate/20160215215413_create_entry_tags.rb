class CreateEntryTags < ActiveRecord::Migration
  def change
    create_table :entry_tags do |t|
      t.integer :post_id, null:false
      t.integer :tag_id, null:false
      t.timestamps null: false
    end
  end
end
