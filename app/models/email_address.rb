class EmailAddress < ActiveRecord::Base
  attr_accessible :email, :emer_contact_id, :patient_id, :type
end
