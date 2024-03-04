class Move < ApplicationRecord
  belongs_to :type

  validates :name, :description, :power, :accuracy, :pp, :move_category, presence: true
  validates :name, uniqueness: true
  validates :power, :pp, :accuracy, numericality: {only_integer: true}
end
