class Shift < ActiveRecord::Base 
  belongs_to :trailer
  belongs_to :worker
  belongs_to :start_depot, :class_name => 'Depot', :foreign_key => 'start_depot_id'
  belongs_to :end_depot, :class_name => 'Depot', :foreign_key => 'end_depot_id'
  before_create :falsify_last_shift
  scope :latest_ones, ->{ where(latest: true)}

  def self.latest_ones
    where(latest: true)
  end

  def incomplete?
    !end_depot
  end

  def started_at
    self.created_at.strftime("%H:%M %d-%m-%Y")
  end

  def falsify_last_shift
    trailer.shifts.last&.update(latest: false)
  end

  def finished_at
    if self.updated_at-self.created_at > 0
      self.updated_at.strftime("%H:%M %d-%m-%Y")
    else
      'On route'
    end
  end

end