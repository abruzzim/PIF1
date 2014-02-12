FactoryGirl.define do

  factory :PhoneNumber do

    association :patient
    areacode  ["212","718","347","646","516","631","201","845","917"].sample
    prefix    { (rand*(999-200+1)+200).round(0).to_s }
    number    { (rand*(9999-1000+1)+1000).round(0).to_s }
    extension { (rand*(99999-1+1)+1).round(0).to_s }
    phtype    ["Home","Office","Mobile"].sample

    factory :HomePhone do
      phtype "Home"
    end

    factory :OfficePhone do
      phtype "Office"
    end

    factory :MobilePhone do
      phtype "Mobile"
    end

  end

end
