class RemoveFkFromLikesToPosts < ActiveRecord::Migration[7.0]
  #Removing the foreign key from likes to comments
  def change
    remove_foreign_key :likes, :posts
  end
end
