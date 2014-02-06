class Patient < ActiveRecord::Base
  attr_accessible :dob, :ethnicity, :fname, :gender, :lname, :race, :ssn
end
