class Trailer < ActiveRecord::Base
  validates :identifier, uniqueness: true
  belongs_to :depot
  has_many :shifts


  def actual_position
    drop_at = self.shifts.last.end_depot
    Depot.find_by_id(drop_at)
  end
end