class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :query, null: false
      t.boolean :is_anonymous, default: false
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
