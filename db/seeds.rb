# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
require 'Faker'

Patient.delete_all
PhoneNumber.delete_all

class PatientsRow

  def initialize
    @fname  = Faker::Name.first_name
    @lname  = Faker::Name.last_name
    @dob    = Date.jd(rand((Date.new(1994,12,31).jd)-(Date.new(1913,1,1).jd)+1)+(Date.new(1913,1,1).jd)).iso8601
    @gender = ["M","M","F"].sample
    @areacode = ["212","718","347","646","516","631","201","845","917"].sample
    @prefix   = (rand*(999-200)+200).round(0).to_s
    @number   = (rand*(9999-1000)+1000).round(0).to_s
    @phtype   = ["Home","Office","Mobile"].sample
  end

  def populate
    patient = Patient.create({
                fname:  @fname,
                lname:  @lname,
                dob:    @dob,
                gender: @gender
              })
    puts "%SEED-I-PATIENTS, database row added."
    ph_num_attrs = {"areacode" => @areacode, "prefix" => @prefix, "number" => @number, "phtype" => @phtype}
    patient.phone_numbers.build(attributes = ph_num_attrs)
    patient.save!
    puts "%SEED-I-PHONENUMBERS, database row added."
  end

end
5.times{PatientsRow.new.populate}

class PhoneNumbersRow

  def initialize
    @areacode = ["212","718","347","646","516","631","201","845","917"].sample
    @prefix   = (rand*(999-200)+200).round(0).to_s
    @number   = (rand*(9999-1000)+1000).round(0).to_s
    @phtype   = ["Home","Office","Mobile"].sample
  end

  def populate
    PhoneNumber.create({
      areacode: @areacode,
      prefix:   @prefix,
      number:   @number,
      phtype:   @phtype
      })
    puts "%SEED-I-PHONENUMBERS, database row added."
  end

end
#5.times{PhoneNumbersRow.new.populate}
