class Shift < ActiveRecord::Base 
  belongs_to :trailer
  belongs_to :worker
  has_one :start_depot, :class_name => 'Depot', :foreign_key => 'id'
  has_one :end_depot, :class_name => 'Depot', :foreign_key => 'id'

end