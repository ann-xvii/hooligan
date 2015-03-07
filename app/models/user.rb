class User
  include Mongoid::Document
  field :firstname, type: String
  field :lastname, type: String
  field :email, type: String
  field :password_digest, type: String

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, uniqueness: {case_sensitive: false }

  def fullname
    "#{firstname} #{lastname}"
  end

  # save encrypted string as a password digest
  def password=(unencrypted_password)
  	unless unencrypted_password.empty?
  		# keep the unencrypted password in memory for a bit
  		@password = unencrypted_password
  		self.password_digest = BCrypt::Password.create(unencrypted_password)
  	end	
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
