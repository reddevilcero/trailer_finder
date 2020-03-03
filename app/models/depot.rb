class Depot < ActiveRecord::Base
  has_many :trailers
  has_one :admin
end