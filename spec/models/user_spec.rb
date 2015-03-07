require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
  	expect(FactoryGirl.build(:user)).to be_valid
  end

  it "is invalid without a firstname" do
  	user = FactoryGirl.build(:user, firstname: nil)
  	expect(user).to be_invalid
  end

  it "is invalid without a lastname" do
  	user = FactoryGirl.build(:user, lastname: nil)
  	expect(user).to be_invalid
  end	

  it "returns a user's full name as a string" do
  	user = FactoryGirl.build(:user)
  	expect(user.fullname).to eq("Matangi Artist")
  end

  it "is invalid without an email address" do 
  	user = FactoryGirl.build(:user, email: nil)
  	expect(user).to be_invalid
  end

  it "is invalid if email isn't formatted correctly" do
  	user = FactoryGirl.build(:user, email: "three")
  	expect(user).to be_invalid
  end

  it "is invalid if a user tries to sign up with an email address that already exists in our database, regardless of capitalization" do
	  user = FactoryGirl.create(:user, email: "bltsong@gmail.com")
	  user1 = FactoryGirl.build(:user, email: "bltSONG@gmail.com")
	  user2 = FactoryGirl.build(:user, email: "bltsong@gmail.com")
	  expect(user1).to be_invalid
	  expect(user2).to be_invalid
	end
end
