class Trailer < ActiveRecord::Base
  validates :identifier, uniqueness: true
  belongs_to :depot
  has_many :shifts


  def actual_position
    self.shifts.last.end_depot
  end
end