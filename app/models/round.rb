class Round < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck
  has_many :guesses
  has_many :cards, through: :guesses

  def self.total_guesses(round_id)
    Guess.where(round_id: round_id).count
  end

  def self.first_guess(round_id)
    Guess.where(round_id: round_id, first_try: true, correct: true).count
  end


  def percent_correct
    first_guess/total_guesses
  end



end
