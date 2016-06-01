class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :display_name, null: false
      t.string :email, null: false
      t.string :password_hash
      t.string :location
      t.string :title
      t.string :about_me

      t.timestamps null: false
    end
  end
end
