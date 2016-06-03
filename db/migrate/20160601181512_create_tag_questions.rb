class CreateTagQuestions < ActiveRecord::Migration
  def change
    create_table :tag_questions do |t|
      t.integer :tag_id
      t.integer :question_id

      t.timestamps null: false
    end
  end
end
