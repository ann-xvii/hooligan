class User
  include Mongoid::Document
  field :firstname, type: String
  field :lastname, type: String
  field :email, type: String
  field :password_digest, type: String


  # save encrypted string as a password digest
  def password=(unencrypted_password)
  	self.password_digest = BCrypt::Password.create(unencrypted_password)
  end

  # a new method, to authenticate a user
  # find user by email
  # they tell us their password
  # we encrypt the password
  # if it matches our saved encrypted password, it must be them

  def authenticate(unencrypted_password)
  	if BCrypt::Password.new(self.password_digest) == unencrypted_password
  		return self
  	else
  		return false
  	end
  end

end
