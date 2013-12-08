class RemoveTweetIdFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :tweet_id
  end
end
