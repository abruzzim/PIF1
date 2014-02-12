require 'Faker'

FactoryGirl.define do

  factory :patient do
    fname  { Faker::Name.first_name }
    lname  { Faker::Name.last_name }
    dob    { Date.jd(rand((Date.new(1994,12,31).jd)-(Date.new(1913,1,1).jd)+1)+(Date.new(1913,1,1).jd)).iso8601 }
    gender { ["M","M","F"].sample }

    # Factory Girl "after" callback to test the nested attributes of patient. For example,
    # the patient interface allows phone numbers to be entered upon creating/editing a patient. 

    after(:build) do |patient_obj|
      [:HomePhone, :OfficePhone, :MobilePhone].each do |inherited_factory|
        patient_obj.phone_numbers << FactoryGirl.build(inherited_factory, patient: patient_obj)
      end
    end

    factory :invalid_patient do
      fname nil
    end

  end

end