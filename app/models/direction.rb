class Direction < ApplicationRecord
  has_many :buses
  has_many :trains
end
