class RemoveAbilityIdFromPokemon < ActiveRecord::Migration[7.1]
  def change
    remove_column :pokemons, :ability_id, :integer
  end
end
