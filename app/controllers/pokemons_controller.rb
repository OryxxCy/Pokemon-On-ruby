class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
  end

  def show
    @pokemon = Pokemon.find(params[:id])
    @pokemon_moves = PokemonMove.where(pokemon_id: @pokemon.id)
    @pokemon_types = PokemonType.where(pokemon_id: @pokemon.id)
  end
end
