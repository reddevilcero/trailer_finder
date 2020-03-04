require_relative './worker'
require_relative './validators/admin_validator'
class Admin < Worker
  validates_with AdminValidator

  def self.all_admins
    self.all.select{|admin| admin if admin.is_admin?}
  end
end