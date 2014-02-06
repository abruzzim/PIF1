class PhoneNumber < ActiveRecord::Base
  attr_accessible :areacode, :emer_contact_id, :extension, :ins_company_id, :number, :patient_id, :pharmacy_id, :prefix
end
