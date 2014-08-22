 require 'faker'
 
 # Create Bookmarks
 50.times do
   Bookmark.create!(
     title: Faker::Company.catch_phrase,  
     body: Faker::Internet.url,
     hashtag: Faker::Lorem.word
   )
 end
 bookmarks = Bookmark.all
 
 # Create Comments
 100.times do
   Comment.create!(
     bookmark: bookmarks.sample,
     body: Faker::Lorem.paragraph
   )
 end
 
 puts "Seed finished"
 puts "#{Bookmark.count} bookmarks created"
 puts "#{Comment.count} comments created"