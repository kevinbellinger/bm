class CreateBookmarksUsers < ActiveRecord::Migration
  def change
    create_table :bookmarks_users do |t|
      t.integer :bookmark_id
      t.integer :user_id
    end
  end
end
