class HomeController < ApplicationController
  def index
    @pokemons = Pokemon.limit(10)
    @moves = Move.limit(10)
  end
end
