class Worker < ActiveRecord::Base 
  belongs_to :depot
  has_secure_password
  validates :email, uniqueness: true, presence: true 
  before_validation :normalize_email

  #normalize email before is pushed to DB that way all emails in DB are downcase.
  def normalize_email
    self.email = self.email.downcase.strip
  end


  def full_name
    "#{first_name} #{last_name}"
  end


  
end