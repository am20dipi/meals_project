class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.string :name
      t.text :content
      t.string :type
      t.integer :user_id
      #t.timestamps null: false
    end
  end
end
