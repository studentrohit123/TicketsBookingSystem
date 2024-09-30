class Train < ApplicationRecord
  belongs_to :direction
  has_many :booking, as: :bookable
end
