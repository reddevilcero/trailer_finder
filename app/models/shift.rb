class Shift < ActiveRecord::Base 
  belongs_to :trailer
  belongs_to :worker
  belongs_to :start_depot, :class_name => 'Depot', :foreign_key => 'start_depot'
  belongs_to :end_depot, :class_name => 'Depot', :foreign_key => 'end_depot'


  def incomplete?
    !self.end_depot
  end
end