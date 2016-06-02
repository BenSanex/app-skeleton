class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value
      t.integer :voter_id
      t.references :votable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
