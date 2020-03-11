class Trailer < ActiveRecord::Base
  validates :identifier, uniqueness: true
  belongs_to :depot
  has_many :shifts, dependent: :destroy


  def actual_position
    if !self.shifts.last.nil? && self.shifts.last.end_depot
      self.shifts.last.end_depot
    else
      'On Route'
    end
  end
end