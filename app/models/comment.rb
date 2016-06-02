class Comment < ActiveRecord::Base
  belongs_to :commenter, class_name: "User"
  belongs_to :commentable, polymorphic: true
  has_many :votes, as: :votable
  has_many :voters, through: :votes

  validates_presence_of :body, :commenter, :commentable
  validates :body, length: { minimum: 5 }

  def points
    votes.sum(:value)
  end
end
