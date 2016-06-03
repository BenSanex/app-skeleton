class Vote < ActiveRecord::Base
  belongs_to :votable, polymorphic: true
  belongs_to :voter, class_name: "User"

  validates :voter, 
            presence: true, 
            uniqueness: { scope: [:votable_id, :votable_type], message: "Only one vote per votable item." }
  validates :votable, presence: true
end
