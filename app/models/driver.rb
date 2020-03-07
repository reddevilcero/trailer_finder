require_relative './worker'
class Driver < Worker
  validates :license, presence: true

end