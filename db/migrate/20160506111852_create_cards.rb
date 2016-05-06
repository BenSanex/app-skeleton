class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |tea|
      tea.integer :deck_id, null: false
      tea.string  :question, null: false
      tea.string  :answer, null: false

      tea.timestamps
  end
end
