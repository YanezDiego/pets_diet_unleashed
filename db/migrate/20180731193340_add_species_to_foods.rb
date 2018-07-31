class AddSpeciesToFoods < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :species, :string
  end
end
