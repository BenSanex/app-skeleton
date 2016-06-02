require 'bcrypt'

class User < ActiveRecord::Base
  has_many :questions, foreign_key: "author_id"
  has_many :answers, foreign_key: "answerer_id"
  has_many :votes, foreign_key: :voter_id
  has_many :comments, as: :commentable
  has_many :favorites
  has_many :favorited_questions, through: :favorites, source: :question

  validates :email, presence: true
  validates :email, uniqueness: true

  def password=(plaintext_password)
    @plaintext_password = plaintext_password
    self.password_hash = BCrypt::Password.create(plaintext_password)
  end

  def password
    @password_hash ||= BCrypt::Password.new(password_hash)
  end

  def authenticate(password)
    self.password == password
  end

  def voted?(votable_obj, value)
    !!votes.find_by(votable: votable_obj, value: value)
  end
end
