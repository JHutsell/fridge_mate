class AddNotesToIngredient < ActiveRecord::Migration[5.2]
  def change
    add_column :ingredients, :notes, :string
    Ingredient.update_all(notes: "")
  end
end
