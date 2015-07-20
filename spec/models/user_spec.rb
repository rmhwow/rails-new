 require 'rails_helper'
 
 describe User do
 
   include TestFactories
 
   describe "#favorited(post)" do
    before do
      @user = User.new(name: "sam", email:"sam@sam.com", password: "samsamsam")
      @post = Post.new(user: @user, topic: @topic, title: "this is really really great", body: "making a long body yeah",created_at: rand(10.minutes .. 1.year).ago)
      @topic = Topic.new(name: "Awesome topic", description: "This is a phenomenal topic")
     

    end
     it "returns `nil` if the user has not favorited the post" do
      expect( @user.favorited(@post) ).to eq(nil)
     end
 
     it "returns the appropriate favorite if it exists" do
      favorite = @user.favorites.where(post: @post).create
      expect(@user.favorited(@post)).to eq (favorite)
     end
   end
 end