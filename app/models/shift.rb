class Shift < ActiveRecord::Base 
  belongs_to :trailer
  belongs_to :worker
end