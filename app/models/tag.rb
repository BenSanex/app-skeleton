class Tag < ActiveRecord::Base
  has_many :questiontags

  validates_presence_of :name
  validates_uniqueness_of :name
end
