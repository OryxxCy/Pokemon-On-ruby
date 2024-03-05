class TypesController < ApplicationController
  def index
    @types = Type.all
  end

  def show
    @type = Type.find(params[:id])
    @pokemon_types = PokemonType.where(type_id: @type.id)
    @pokemon_moves = Move.where(type_id: @type.id)
  end
end
