class Question < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :favorites
  has_many :favoriters, through: :favorites, source: :user
  has_many :answers
  has_many :answerers, through: :answers
  has_many :votes, as: :votable
  has_many :comments, as: :commentable
  has_many :tags

  validates_presence_of :author, :body
  validats :tags, numericality: { less_than_or_equal_to: 5 }
  validats :body, length: { minimum: 10 }
end
