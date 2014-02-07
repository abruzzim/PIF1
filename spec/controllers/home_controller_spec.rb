require 'spec_helper'

describe 'HomeController' do
  describe 'Actions:' do
    let(:valid_attributes) {
      {fname: "Mario",  lname: "Abruzzi",  dob: "1965-10-21", gender: "M"}
      {fname: "Wendy",  lname: "Ziecheck", dob: "1956-04-27", gender: "F"}
      {fname: "Justin", lname: "Tirelli",  dob: "1977-02-08", gender: "M"}
    }
    let(:valid_session) {
      {}
    }
    describe 'GET #index;' do
      it 'assigns all patients to patients;' do
        patients = Patient.create! valid_attributes
        expect(assigns(:patients)).to eq([patients])
      end
    end
  end
end