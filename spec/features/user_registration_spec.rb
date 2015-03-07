require 'rails_helper'

def get_sign_up
	visit "/"
	visit "/signup"
end


describe "Signing up for Hooligan" do 
	it "allows a user to sign up for the site and creates an object in the database" do
		expect(User.count).to eq(0)
		get_sign_up
		expect(page).to have_content("Sign up")

		fill_in "Firstname", with: "Jabba"
		fill_in "Lastname", with: "the Hut"
		fill_in "Email", with: "jabba@thehut.com"
		fill_in "Password", with: "password"
		fill_in "Confirmation", with: "password"

		click_button "Become a hooligan!"
		expect(User.count).to eq(1)
	end

	it "does not allow a user to sign up with a password that is too short" do
		expect(User.count).to eq(0)
		get_sign_up

		fill_in "Firstname", with: "Jabba"
		fill_in "Lastname", with: "the Hut"
		fill_in "Email", with: "jabba@thehut.com"
		fill_in "Password", with: "pass"
		fill_in "Confirmation", with: "pass"
		click_button "Become a hooligan!"
		expect(User.count).to eq(0)
	end

	it "does not allow a user to sign up with a password confirmation that does not match password" do
		expect(User.count).to eq(0)
		get_sign_up

		fill_in "Firstname", with: "Jabba"
		fill_in "Lastname", with: "the Hut"
		fill_in "Email", with: "jabba@thehut.com"
		fill_in "Password", with: "password"
		fill_in "Confirmation", with: "pass"
		click_button "Become a hooligan!"
		expect(User.count).to eq(0)
	end

	it "does not allow a user to sign up with an invalid email address" do
		expect(User.count).to eq(0)
		get_sign_up

		fill_in "Firstname", with: "Jabba"
		fill_in "Lastname", with: "the Hut"
		fill_in "Email", with: "jabba@"
		fill_in "Password", with: "password"
		fill_in "Confirmation", with: "password"
		click_button "Become a hooligan!"
		expect(User.count).to eq(0)
	end
end