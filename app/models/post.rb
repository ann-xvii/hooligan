class Post
  include Mongoid::Document
  field :content, type: String

  validates :content, presence: true, length: { maximum: 400 }

  belongs_to :user

  def date_published
    created_at.localtime.strftime("%A, %B %-d, %Y at %l:%M %p")
  end
end
