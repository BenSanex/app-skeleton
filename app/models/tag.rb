class Tag < ActiveRecord::Base
  belongs_to :question

  validates_presence_of :question, :name
  validates_uniqueness_of :name
end
