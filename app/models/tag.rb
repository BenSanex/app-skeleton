class Tag < ActiveRecord::Base
  has_many :tagsquestions, class_name: 'TagQuestion'
  has_many :questions, through: :tagsquestions

  validates :name, presence: true, uniqueness: true
end
