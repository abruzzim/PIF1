require 'spec_helper'

describe Patient do
  # it "is valid with a firstname, lastname, dob and gender;" do
  #   patient = Patient.new(
  #     fname: 'Mario',
  #     lname: 'Abruzzi',
  #     dob: '1965-10-21',
  #     gender: 'M'
  #     )
  #   expect(patient).to be_valid
  # end
  it "is a valid Factory with a firstname, lastname, dob and gender;" do
    expect(build(:patient)).to be_valid
  end
  it "is invalid without a firstname;" do
    patient = build(:patient, fname: nil)
    expect(patient).to have(1).errors_on(:fname)
  end
  it "is invalid without a lastname;" do
    patient = FactoryGirl.build(:patient, lname: nil)
    expect(patient).to have(1).errors_on(:lname)
  end
  it "is invalid without a date-of-birth;" do
    expect(Patient.new(dob: nil)).to have(1).errors_on(:dob)
  end
  it "is invalid without a gender;" do
    expect(Patient.new(gender: nil)).to have(1).errors_on(:gender)
  end
  it "returns a patient's full name as a string;" do
    # patient = Patient.new(
    #   fname: 'Mario',
    #   lname: 'Abruzzi',
    #   dob: '1965-10-21',
    #   gender: 'M'
    #   )
    patient = FactoryGirl.build(:patient, fname: "Jane", lname: "Doe")
    expect(patient.name).to eq 'Jane Doe'
  end
  describe "filter last name by letter;" do
    before :each do
      @smith = Patient.create(
        fname: 'Mario',
        lname: 'Smith',
        dob: '1965-10-21',
        gender: 'M'
        )
      @jones = Patient.create(
        fname: 'Wendy',
        lname: 'Jones',
        dob: '1975-1-21',
        gender: 'F'
        )
      @johnson = Patient.create(
        fname: 'Toni',
        lname: 'Johnson',
        dob: '1975-1-21',
        gender: 'F'
        )
    end
    it "matching letters;" do
      expect(Patient.by_letter("J")).to eq [@johnson, @jones]
    end
    it "non-matching letters;" do
      expect(Patient.by_letter("J")).to_not include @smith
    end
  end
end
