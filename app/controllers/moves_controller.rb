class MovesController < ApplicationController
  def index
    @moves = Move.all
  end

  def show
    @move = Move.find(params[:id])
    @pokemon_moves = PokemonMove.where(move_id: @move.id)
  end
end
