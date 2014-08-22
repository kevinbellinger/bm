class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :title
      t.text :body
      t.string :hashtag

      t.timestamps
    end
  end
end
