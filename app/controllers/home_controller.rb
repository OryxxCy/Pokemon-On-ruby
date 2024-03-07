class HomeController < ApplicationController
  def index
    @pokemons = Pokemon.all
  end

  def about

  end
end
