require 'spec_helper'

describe PatientsController do
  # describe 'GET #index' do
  #   describe 'without params[:letter]' do
  #     it "populates an array of all patients in alphabetical order" do
  #       smith = create(:patient, lname: 'Smith')
  #       zychn = create(:patient, lname: 'Zychn')
  #       jones = create(:patient, lname: 'Jones')
  #       get :index
  #       expect(assigns(:patient)).to eq([jones,smith,zychn])
  #     end
  #     it "renders the :index template" do
  #       get :index
  #       expect(response).to render_template :index
  #     end
  #   end
  #   describe 'with params[:letter]' do
  #     it "populates an array of all patients starting with the letter" do
  #       smith = create(:patient, lname: 'Smith')
  #       jones = create(:patient, lname: 'Jones')
  #       get :index, letter: 'S'
  #       expect(assigns(:patient)).to match_array([smith])
  #     end
  #     it "renders the :index template" do
  #       get :index, letter: 'S'
  #       expect(response).to render_template :index
  #     end
  #   end
  # end
  # describe 'GET #show' do
  #   it "assigns the requested patient to @patient" do
  #     patient = create(:patient)
  #     get :show, id: patient
  #     expect(assigns(:patient)).to eq patient
  #   end
  #   it "renders the :show template" do
  #     patient = create(:patient)
  #     get :show, id: patient
  #     expect(response).to render_template :show
  #   end
  # end
  describe 'GET #new' do
    it "assigns a new patient to @patient" do
      get :new
      expect(assigns(:patient)).to be_a_new(Patient)
    end
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end
  # describe 'GET #edit' do
  #   it "finds and assigns the requested patient to @patient" do
  #     patient = create(:patient)
  #     get :edit, id: patient
  #     expect(assigns(:patient)).to eq patient
  #   end
  #   it "renders the :edit template" do
  #     patient = create(:patient)
  #     get :edit, id: patient
  #     expect(response).to render_template :edit
  #   end
  # end
  describe 'POST #create' do
    before :each do
      @phone_numbers = [
        attributes_for(:HomePhone),
        attributes_for(:OfficePhone),
        attributes_for(:MobilePhone)
      ]
    end
    describe 'with valid attributes' do
      it "saves the new patient in the database" do
        expect{
          post :create, 
          patient: attributes_for(:patient, phone_numbers_attributes: @phone_numbers)
          }.to change(Patient, :count).by(1)
      end
      it "redirects the patients#show" do
        post :create, patient: attributes_for(:patient, phone_numbers_attributes: @phone_numbers)
        expect(response).to redirect_to patient_path(assigns[:patient])
      end
    end
    describe 'with invalid attributes' do
      it "does not save the new patient in the database"
      it "re-renders the :new template"
    end
  end
  describe 'PATCH #update' do
    describe 'with valid attributes' do
      it "updates the patient in the database"
      it "redirects the patient"
    end
    describe 'with invalid attributes' do
      it "does not update the patient in the database"
      it "re-renders the :edit template"
    end
  end
  describe 'DELETE #destroy' do
    it "deletes the patient from the database"
    it "redirects to ?????#index"
  end
end