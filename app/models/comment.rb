class Comment < ActiveRecord::Base
  belongs_to :commenter, class_name: "User"
  belongs_to :commentable, polymorphic: true

  validates_presence_of :body, :commenter, :commentable
  validates :body, length: { minimum: 5 }
end
