class Question < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :favorites
  has_many :favoriters, through: :favorites, source: :user
  has_many :answers
  has_many :answerers, through: :answers
  has_many :votes, as: :votable
  has_many :comments, as: :commentable
  has_many :tags
end
