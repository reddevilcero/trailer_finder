class Trailer < ActiveRecord::Base
  validates :trailer_number, uniqueness: true
  belongs_to :depot
end