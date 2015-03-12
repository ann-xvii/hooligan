class Post
  include Mongoid::Document
  field :content, type: String

  validates :content, presence: true, length: { maximum: 400 }

  belongs_to :user
end
