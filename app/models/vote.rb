class Vote < ActiveRecord::Base
  belongs_to :votable, polymorphic: true
  belongs_to :voter, class_name: "User"

  validates_presence_of :votable, :voter
  validates_uniqueness_of :voter, scope: [ :votable_type, :votable_id ], message: "Only one vote per votable item."
end
