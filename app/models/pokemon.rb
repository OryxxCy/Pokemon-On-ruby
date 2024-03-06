class Pokemon < ApplicationRecord
  has_many :pokemon_types
  has_many :types, through: :pokemon_types
  has_many :pokemon_moves
  has_many :moves, through: :pokemon_moves

  validates :name, :description, :hp, :attack, :special_attack, :defense, :special_defense, :speed, presence: true
  validates :name, uniqueness: true
  validates :hp, :attack, :special_attack, :defense, :special_defense, :speed, numericality: {only_integer: true}
end
