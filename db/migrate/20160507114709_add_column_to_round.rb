class AddColumnToRound < ActiveRecord::Migration
  def change
    remove_column :rounds, :first_try_correct, :integer
    add_column :rounds, :first_try_correct, :float

  end
end
