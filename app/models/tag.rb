class Tag < ActiveRecord::Base
  has_many :tagsquestions

  validates_presence_of :name
  validates_uniqueness_of :name
end
