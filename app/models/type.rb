class Type < ApplicationRecord
  has_many :moves

  validates :name, presence: true, uniqueness: true
end
