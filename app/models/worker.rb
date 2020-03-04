class Worker < ActiveRecord::Base 
  belongs_to :depot
 has_secure_password
 validates :email, uniqueness: true, presence: true
end