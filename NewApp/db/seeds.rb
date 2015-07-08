# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'
 
 # Create Posts
 50.times do
   Post.create!(
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
 end

my_post = Post.create(
  title: "Awesome Post",
  body: "Hey this is my post about the chicken farm"
  ) 

 unless my_post
 Post.create(
  title: "Awesome Post",
  body: "Hey this is my post about the chicken farm"
  )
end

 posts = Post.all
 
 # Create Comments
 100.times do
   Comment.create!(
     post: posts.sample,
     body: Faker::Lorem.paragraph
   )
 end

my_comment = Comment.create(
  post: my_post,
  body: "this is awesome"
  )
 unless my_comment
  Comment.create(
  post: my_post,
  body: "this is awesome"
  )
end

 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"