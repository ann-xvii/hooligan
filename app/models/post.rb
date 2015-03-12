class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  field :content, type: String
  mount_uploader :picture, PictureUploader

  validates :content, presence: true, length: { maximum: 400 }
  

  belongs_to :user

  def date_published
    created_at.localtime.strftime("%A, %B %-d, %Y at %l:%M %p")
  end

  private
  	# validates the size of an uploaded image
  	def picture_size
  		if picture_size > 5.megabytes
  			errors.add(:picture, " should be less than 5MB")
  		end
  	end
end
