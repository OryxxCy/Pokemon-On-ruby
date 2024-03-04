class Move < ApplicationRecord
  belongs_to :type

  validates :name, :desciption, :power, :accuracy, :move_category, presence: true
  validates :name, uniqueness: true
  validates :power, :accuracy, numericality: {only_integer: true}
end
