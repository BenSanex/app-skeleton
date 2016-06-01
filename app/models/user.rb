class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :votes, as: :votable
  has_many :comments, as: :commentable
  has_many :favorites
  has_many :favorited_questions, through: :favorites, source: :question
end
