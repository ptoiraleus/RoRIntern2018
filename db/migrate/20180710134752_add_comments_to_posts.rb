class AddCommentsToPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :title
      t.text :content
      t.integer :post_id, index: true
      t.integer :author_id, index: true
      t.timestamps
    end
  end
end
