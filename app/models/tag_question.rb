class TagQuestion < ActiveRecord::Base
  belongs_to :question
  belongs_to :tag

  validates :question, presence: true
  validates :tag, presence: true
end
