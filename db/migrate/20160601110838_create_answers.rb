class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :body
      t.boolean :best?, default: false
      t.integer :answerer_id
      t.integer :question_id

      t.timestamps null: false
    end
  end
end
