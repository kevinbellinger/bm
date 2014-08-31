 require 'faker'
 
  # Create Users
  10.times do
    user = User.new(
      name:     Faker::Name.name,
      email:    Faker::Internet.email,
      password: Faker::Lorem.characters(10)
      )
 #   user.skip_confirmation!
    user.save!
  end
  users = User.all

kevin = User.new(
  name:     'Kevin',
  email:    'kevin@example.com',
  password: 'helloworld',
  )
kevin.save

 # Create Bookmarks
 20.times do
   Bookmark.create!(
     user:   users.sample,
     title: Faker::Company.catch_phrase,  
     body: Faker::Internet.url,
     hashtag: "##{Faker::Lorem.word}"
     )
 end
 bookmarks = Bookmark.all
 
 # Create Likes
 1000.times do
   Favorite.create!(
     user_id: users.sample,
     bookmark_id: bookmarks.sample,
     #body: Faker::Lorem.paragraph
     )
 end
 favorites = Favorite.all

 
 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Bookmark.count} bookmarks created"
 puts "#{Favorite.count} likes created"