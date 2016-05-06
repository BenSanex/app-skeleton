class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.integer :card_id, null: false
      t.boolean :first_try, null: false
      t.integer :round_id, null: false
      t.boolean :correct, null: false

      t.timestamps
    end
  end
end
