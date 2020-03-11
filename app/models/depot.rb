class Depot < ActiveRecord::Base
  has_many :trailers
  has_many :workers
  has_many :ever_ended_shifts, class_name: 'Shift', foreign_key: 'end_depot_id'
  has_many :ever_parked_trailers, -> { distinct }, through: :ever_ended_shifts, source: 'trailer'
   
  
  def parked_trailers
    ever_parked_trailers.includes(:shifts).select{|t| t.actual_position == self}
  end

   def depot_trailers
    Trailer.where(depot_id: self.id)
  end

  # def parked_trailers
  #   # need a rethink to improve query and relation
  #   # maybe change db structure?
  #   query = 
  #   "
  #   SELECT * FROM shifts
  #   JOIN trailers ON shifts.trailer_id = trailers.id
  #   WHERE shifts.end_depot = #{self.id}
  #   ORDER BY shifts.id DESC LIMIT 120
  #   "
  #   reduce_query = Shift.find_by_sql(query)   
  #   reduce_query.collect{|shift| shift.trailer if shift.trailer.actual_position == self}.compact!
  # end

  def branch
    "#{self.name} #{self.location}"
  end
  def slug
    self.branch.downcase.gsub(' ','-')
  end

  def self.find_by_slug(slug)
    self.all.find{|object| object.slug == slug}
  end

 

  # def self.
end