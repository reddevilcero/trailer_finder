class Trailer < ActiveRecord::Base
  validates :identifier, uniqueness: true
  belongs_to :depot
  has_many :shifts, dependent: :destroy


  def actual_position
    shifts.last&.end_depot || 'On Route'
  end
end