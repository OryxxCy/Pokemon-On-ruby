class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def search
    search_term = "%#{params[:keywords]}%"
    @pokemons = Pokemon.where("name LIKE ?", search_term)
  end
end
