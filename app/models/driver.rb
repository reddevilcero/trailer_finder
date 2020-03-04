require_relative './worker'
class Driver < Worker
  validates :license, presence: true

  def self.all_drivers
    self.all.select{|driver| driver if !driver.license.nil?}
  end
end