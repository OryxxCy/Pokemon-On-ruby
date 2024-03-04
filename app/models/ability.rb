class Ability < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :desciption, presence: true
end
