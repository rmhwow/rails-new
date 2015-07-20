require 'rails_helper'

# RSpec.describe Vote, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe Vote do
    include Devise::TestHelpers
   include TestFactories
  describe "validations" do

    before do 
      @up_vote = Vote.new(value: 1)
      @down_vote = Vote.new(value: -1)
      @bad_vote = Vote.new(value: 4)
    end

    describe "value validation" do
      it "only allows -1 or 1 as values" do
        expect(@up_vote.valid?).to eq(true) 
        expect(@down_vote.valid?).to eq(true)
        expect(@bad_vote.valid?).to eq(false)
      end
    end
  end
     describe 'after_save' do
     it "calls `Post#update_rank` after save" do
       post = associated_post
       vote = Vote.new(value: 1, post: post)
       expect(post).to receive(:update_rank)
       vote.save
     end
   end
 
end