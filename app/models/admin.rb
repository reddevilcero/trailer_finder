require_relative './worker'
require_relative './validators/admin_validator'
class Admin < Worker
  validates_with AdminValidator
end