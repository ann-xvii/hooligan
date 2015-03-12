require 'rails_helper'

RSpec.describe Post, type: :model do
  it "has a valid factory" do
  	expect(FactoryGirl.build(:post)).to be_valid
  end

  it "is invalid without content" do
  	post = FactoryGirl.build(:post, content: nil)
  	expect(post).to be_invalid
  end

  it "is invalid if content is too long" do
  	post = FactoryGirl.build(:post, content: "a"*401)
  	expect(post).to be_invalid
  end

  it "has a user id" do
  	user = FactoryGirl.create(:user, firstname: "Matangi")
  	post = FactoryGirl.build(:post, content: "If you're gonna be me you need a manifesto if you don't have one you better get one presto", user_id: user.id)
  end
end
