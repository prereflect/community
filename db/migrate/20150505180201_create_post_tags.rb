class CreatePostTags < ActiveRecord::Migration
  def change
    create_table :post_tags do |t|
      t.integer :post_id, :tag_id

      t.timestamps null: false
    end
  end
end
