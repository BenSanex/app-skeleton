class CreateQuestionTags < ActiveRecord::Migration
  def change
    t.integer :tag_id, null: false
    t.integer :question_id, null: false

    t.timestamps null: false
  end
end
