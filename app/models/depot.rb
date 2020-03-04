class Depot < ActiveRecord::Base
  has_many :trailers
  has_many :drivers
  has_many :admins
  has_many :workers


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