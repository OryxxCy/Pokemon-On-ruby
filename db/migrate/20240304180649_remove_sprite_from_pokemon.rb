class RemoveSpriteFromPokemon < ActiveRecord::Migration[7.1]
  def change
    remove_column :pokemons, :sprite, :string
  end
end
