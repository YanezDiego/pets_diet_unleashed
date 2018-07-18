class CreateDiets < ActiveRecord::Migration[5.2]
  def change
    create_table :diets do |t|
      t.string :name
      t.integer :pet_id
      t.integer :food_id

      t.timestamps
    end
  end
end
