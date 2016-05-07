class Card < ActiveRecord::Base
  belongs_to :deck
  has_many :guesses

  def verify_guess(player_guess)
    player_guess == self.answer
  end

end
