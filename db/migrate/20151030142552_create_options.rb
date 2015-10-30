class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.integer :question_id, null: false
      t.string :response, null: false

      t.timestamps null: false
    end
  end
end
