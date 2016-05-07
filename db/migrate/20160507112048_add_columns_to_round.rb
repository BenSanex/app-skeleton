class AddColumnsToRound < ActiveRecord::Migration
  def change
    add_column :rounds, :number_of_cards, :integer
    add_column :rounds, :first_try_correct, :integer
    add_column :rounds, :total_guesses, :integer
  end
end
