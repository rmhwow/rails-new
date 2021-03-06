# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'
  # Create Users
 5.times do
   user = User.new(
     name:     Faker::Name.name,
     email:    Faker::Internet.email,
     password: Faker::Lorem.characters(10)
   )
   user.skip_confirmation!
   user.save!
 end
 
 # admin = User.where(
 #   name:     'Admin User',
 #   email:    'admin@example.com',
 #   password: 'helloworld',
 #   role:     'admin'
 # ).first 
 
 # unless admin
   admin = User.new(
    name: 'Admin User',
    email: 'admin@example.com',
    password: 'helloworld',
    role: 'admin'
    )
   admin.skip_confirmation!
  admin.save!
  # end


 
 # Create a moderator
 moderator = User.new(
   name:     'Moderator User',
   email:    'moderator@example.com',
   password: 'helloworld',
   role:     'moderator'
 )
 moderator.skip_confirmation!
 moderator.save!
 
 # Create a member
 member = User.new(
   name:     'Member User',
   email:    'member@example.com',
   password: 'helloworld'
 )
 member.skip_confirmation!
 member.save!
 users = User.all
 
 # Note: by calling `User.new` instead of `create`,
 # we create an instance of User which isn't immediately saved to the database.
 
 # The `skip_confirmation!` method sets the `confirmed_at` attribute
 # to avoid triggering an confirmation email when the User is saved.
 
 # The `save` method then saves this User to the database.
 # Create Posts
  100.times do
   Topic.create!(
     name:         Faker::Lorem.sentence,
     description:  Faker::Lorem.paragraph
   )
 end
 topics = Topic.all

 50.times do
   post = Post.create!(
     user:   users.sample,
     topic:  topics.sample,
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
    post.update_attributes!(created_at: rand(10.minutes .. 1.year).ago)
   post.create_vote
 end
 posts = Post.all

# my_post = Post.where(
#   title: "Awesome Post",
#   body: "Hey this is my post about the chicken farm"
#   ).first 

#  unless my_post
#  my_post = Post.create(
#   title: "Awesome Post",
#   body: "Hey this is my post about the chicken farm"
#   )
#  end

 
 # Create Comments
 1000.times do
   Comment.create!(
    user: users.sample,
     post: posts.sample,
     body: Faker::Lorem.paragraph
   )
 end

 

# my_comment = Comment.where(
#   post: my_post,
#   body: "this is awesome"
#   ).first

#  unless my_comment
#   Comment.create(
#   post: my_post,
#   body: "this is awesome"
#   )
# end
# 15.times do
#    Advertisement.create!(
#      title:  Faker::Lorem.words(4).join(" "),
#      copy:   Faker::Lorem.paragraph,
#      price:  Faker::Number.positive
#    )
#  end

#  10.times do 
#   Question.create!(
#     title: Faker::Lorem.words(4).join(" "),
#     body: Faker::Lorem.paragraph,
#     resolved: false
#     )
# end


 # user = User.first
 # user.skip_reconfirmation!
 # user.update_attributes!(
 #   email: 'youremail@email.com',
 #   password: 'helloworld'
 # )

 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"