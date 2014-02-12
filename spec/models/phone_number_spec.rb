require 'spec_helper'

describe PhoneNumber do
  describe "Format:" do
    it "is a valid Factory with area code, prefix, number and phtype;" do
      expect(build(:PhoneNumber)).to be_valid
    end
    it "is invalid without an area code;" do
      expect(build(:PhoneNumber, areacode: nil)).to have(1).errors_on(:areacode)
    end
    it "is invalid without a prefix;" do
      expect(build(:PhoneNumber, prefix: nil)).to have(1).errors_on(:prefix)
    end
    it "is invalid without a number;" do
      expect(build(:PhoneNumber, number: nil)).to have(1).errors_on(:number)
    end
    it "is invalid without a phtype;" do
      expect(build(:PhoneNumber, phtype: nil)).to have(1).errors_on(:phtype)
    end
  end
  describe "Behavior:" do
    it "allows two patients to share a phone number;" do
      create(:HomePhone,
              areacode: "718",
              prefix: "949",
              number: "1212"
      )
      expect(build(:HomePhone,
                    areacode: "718",
                    prefix: "949",
                    number: "1212"
            )
      ).to be_valid
    end
  end
  describe "Methods:" do
    it "returns a full phone number as a formatted string;" do
      phone_number = build(:PhoneNumber, 
                            areacode: "212", 
                            prefix: "758", 
                            number: "5906"
      )
      expect(phone_number.full).to eq '(212) 758-5906'
    end
  end
end
