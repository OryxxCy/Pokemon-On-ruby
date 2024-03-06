class Move < ApplicationRecord
  belongs_to :type
  has_many :pokemon_moves
  has_many :pokemons, through: :pokemon_moves

  validates :name, :description, :power, :accuracy, :pp, :move_category, presence: true
  validates :name, uniqueness: true
  validates :power, :pp, :accuracy, numericality: {only_integer: true}
end
