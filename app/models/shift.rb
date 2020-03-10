class Shift < ActiveRecord::Base 
  belongs_to :trailer
  belongs_to :worker
  belongs_to :start_depot, :class_name => 'Depot', :foreign_key => 'start_depot'
  belongs_to :end_depot, :class_name => 'Depot', :foreign_key => 'end_depot'


  def incomplete?
    !self.end_depot
  end
  def started_at
    self.created_at.strftime("%H:%M %d-%m-%Y")
  end

  def finished_at
    if self.updated_at-self.created_at > 0
      self.updated_at.strftime("%H:%M %d-%m-%Y")
    else
      'On route'
    end

  end
end