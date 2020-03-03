class Trailer < ActiveRecord::Base
  validates :identifier, uniqueness: true
  belongs_to :depot
  has_one :admin, through: :depot
end