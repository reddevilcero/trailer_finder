class AdminValidator < ActiveModel::Validator
  def validate(record)
    if record.is_admin? == false
      record.errors[:base] << "Admin attribute must be True"
    end
  end
end
