class Question < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :favorites
  has_many :favoriters, through: :favorites, source: :user
  has_many :answers
  has_many :answerers, through: :answers
  has_many :votes, as: :votable
  has_many :comments, as: :commentable
  has_many :questiontags

  validates_presence_of :author, :body
  validates :body, length: { minimum: 10 }
  validate :validate_tag_count

  def validate_tag_count
    errors.add(:questiontags, "too much") if questiontags.size > 5
  end
end
