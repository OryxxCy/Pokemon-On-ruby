class Pokemon < ApplicationRecord
  validates :name, :description, :hp, :attack, :special_attack, :defense, :special_defense, :speed, presence: true
  validates :name, uniqueness: true
  validates :hp, :attack, :special_attack, :defense, :special_defense, :speed, numericality: {only_integer: true}
end
