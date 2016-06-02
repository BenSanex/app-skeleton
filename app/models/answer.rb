class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :answerer, class_name: "User"
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates_presence_of :answerer, :body, :question
  validates :body, length: { minimum: 5 }

  def points
    votes.sum(:value)
  end
end