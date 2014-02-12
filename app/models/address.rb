class Address < ActiveRecord::Base
  attr_accessible :addr1, :addr2, :city, :emer_contact_id, :ins_company_id, :patient_id, :pharmacy_id, :presort, :state, :strnum, :zip, :adtype
end
