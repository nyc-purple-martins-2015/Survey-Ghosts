class CreateChosenOptions < ActiveRecord::Migration
  def change
    create_table :chosen_options do |t|
      t.integer :user_id, null: false
      t.integer :option_id, null: false
      t.integer :survey_id, null: false

      t.timestamps null: false
    end
  end
end
