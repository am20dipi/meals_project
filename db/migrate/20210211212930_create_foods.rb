class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string :name
      t.text :content
      t.string :meal
      t.string :make_again?
      t.integer :user_id
    end

  end
end
