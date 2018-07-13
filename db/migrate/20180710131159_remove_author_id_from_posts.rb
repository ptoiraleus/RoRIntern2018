class RemoveAuthorIdFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :author_id, :integer, index:true
  end
end
