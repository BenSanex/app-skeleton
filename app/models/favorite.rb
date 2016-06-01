class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  validates_presence_of :user, :question
  validates_uniqueness_of :user, scope: :question, message: "You already favorited this"
end
