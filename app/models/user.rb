class User
  include Mongoid::Document
  field :firstname, type: String
  field :lastname, type: String
  field :email, type: String
  field :password_digest, type: String
  field :remember_digest, type: String

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, uniqueness: {case_sensitive: false }
  validates :password, presence: true, length: { in: 6..20}, confirmation: true
  before_save :downcase_email
  attr_reader :password
  attr_accessor :remember_token
  
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


  def downcase_email
    self.email = email.downcase!
  end


  # returns a hash digest of the given string
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost

    BCrypt::Password.create(string, cost: cost)
  end

  # returns a random token
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # remembers a user in the database for use in persistent sessions
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

end
