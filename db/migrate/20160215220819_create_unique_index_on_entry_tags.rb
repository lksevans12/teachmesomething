class CreateUniqueIndexOnEntryTags < ActiveRecord::Migration
  def change
    add_index :entry_tags, [:post_id, :tag_id], unique: true
  end
end
