class CreateTagQuestions < ActiveRecord::Migration
  def change
    create_table :tag_questions do |t|
      t.integer :tag_id, null: false
      t.integer :question_id, null: false

      t.timestamps null: false
    end
  end
end
