class Depot < ActiveRecord::Base
  has_many :trailers
  has_many :workers
  has_many :depot_trailers, class_name: 'Trailer'

  has_many :currently_ended_shifts, -> {latest_ones}, class_name: 'Shift', foreign_key: 'end_depot_id'
  has_many :current_trailers, through: :currently_ended_shifts, source: 'trailer'

  has_many :ever_ended_shifts, class_name: 'Shift', foreign_key: 'end_depot_id'
  has_many :ever_parked_trailers, -> { distinct }, through: :ever_ended_shifts, source: 'trailer'
  
  def parked_trailers
    ever_parked_trailers.includes(:shifts).select{|t| t.actual_position.id == id}
  end

  def alt_trailers
    ever_ended_shifts.includes(trailer: :shifts).filter_map{|s|
      s.trailer if s == s.trailer.shifts.last
    }
  end

  def sql
    sql = <<~SQL
    SELECT trailers.*, max(shifts.created_at) FROM shifts
    JOIN trailers ON shifts.trailer_id = trailers.id
    GROUP BY shifts.trailer_id HAVING shifts.end_depot_id = #{id}
    SQL
    Trailer.find_by_sql(sql)
  end

  def much_better
    Shift.select(
    [
      Shift.arel_table[Arel.star], Shift.arel_table[:created_at].maximum
    ]
    ).having(Shift.arel_table[:end_depot_id].eq(id))
    .group(:trailer_id).includes(:trailer).map{|s| s.trailer}
  end

  def sql_arel
    Shift.select(
    [
      Shift.arel_table[:trailer_id], Shift.arel_table[:created_at].maximum
    ]
    ).having(Shift.arel_table[:end_depot_id].eq(id)).joins(
      Shift.arel_table.join(Trailer.arel_table).on(
      Shift.arel_table[:trailer_id].eq(Trailer.arel_table[:id])
    ).join_sources
    ).group(Shift.arel_table[:trailer_id]).includes(:trailer).map{|s| s.trailer}
  end

  def sql_better
    sql = <<~SQL
    WITH rel_shifts AS (
      SELECT shifts.trailer_id, max(shifts.created_at)
      FROM shifts JOIN trailers ON shifts.trailer_id = trailers.id
      GROUP BY shifts.trailer_id HAVING shifts.end_depot_id = #{id}
    )
    SELECT trailers.* FROM trailers
    JOIN rel_shifts ON rel_shifts.trailer_id = trailers.id
    SQL
    Trailer.find_by_sql(sql)
  end

  def branch
    "#{self.name} #{self.location}"
  end

  def slug
    self.branch.downcase.gsub(' ','-')
  end

  def self.find_by_slug(slug)
    self.all.find{|object| object.slug == slug}
  end

end
