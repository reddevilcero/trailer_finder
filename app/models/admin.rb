class Admin < ActiveRecord::Base 
  validates :email, uniqueness: true
  has_one :depot
  has_many :trailers, through: :depot
end