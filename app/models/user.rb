require 'bcrypt'

class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :votes, as: :votable
  has_many :comments, as: :commentable
  has_many :favorites
  has_many :favorited_questions, through: :favorites, source: :question

  validates :email, presence: true, uniqueness: true

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


end
