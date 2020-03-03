class Depot < ActiveRecord::Base
  has_many :trailers
  has_one :admin


  def slug
    "#{self.name} #{self.location}".downcase.gsub(' ','-')
  end

  def self.find_by_slug(slug)
    self.all.find{|object| object.slug == slug}
  end

  def normalize
    self.slug.gsub('-', ' ').titleize
  end
end