require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "password_reset" do
    user = FactoryGirl.build(:user, firstname: "Sir Roger", lastname: "Moore", email: "to@example.org", password: "password")
    let(:mail) { UserMailer.password_reset(user) }
    user.reset_token = User.new_token

    it "renders the headers" do
      expect(mail.subject).to eq("Password reset | Hooligan")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["team@hooligans.org"])
    end

    # it "renders the body" do
    #   expect(mail.body.encoded).to match("Hi")
    # end
  end

end
