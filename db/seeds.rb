 require 'faker'
 
  # Create Users
  5.times do
    user = User.new(
      name:     Faker::Name.name,
      email:    Faker::Internet.email,
      password: Faker::Lorem.characters(10)
      )
 #   user.skip_confirmation!
    user.save!
  end
  users = User.all

 # Create Bookmarks
 50.times do
   Bookmark.create!(
     user:   users.sample,
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
 
User.first.update_attributes!(
  email: 'kevin@glider.io',
  password: 'helloworld',
)
 
 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Bookmark.count} bookmarks created"
 puts "#{Comment.count} comments created"