class PatientsController < ApplicationController
  # GET /patients
  def index
    if params[:letter]
      @patients = Patient.by_letter(params[:letter])
    else
      @patients = Patient.order(:lname)
    end
  end
  # GET /patients/1
  def show
    @patient = Patient.find(params[:id])
    @phone_numbers = @patient.phone_numbers
    @index = 1
  end
  # GET /patients/new
  def new
    @patient = Patient.new
  end
  # POST /patients
  def create
    @patient = Patient.create(
      fname:     params[:patient][:fname].capitalize,
      lname:     params[:patient][:lname].capitalize,
      dob:       params[:patient][:dob],
      gender:    params[:patient][:gender],
      ssn:       params[:patient][:ssn],
      race:      params[:patient][:race],
      ethnicity: params[:patient][:ethnicity]
    )
    @patient.phone_numbers_attributes = params[:patient][:phone_numbers_attributes]
    @patient.save
    redirect_to patients_path, :flash => { :success => "Patient record created." }
  end
  # GET /patients/1/edit
  def edit
    @patient = Patient.find(params[:id])
    @phone_numbers = @patient.phone_numbers
    @index = 1
  end
  # PUT /patients/1
  def update
    patient = Patient.find(params[:id])
    patient.update_attributes(
      fname:     params[:patient][:fname].capitalize,
      lname:     params[:patient][:lname].capitalize,
      dob:       params[:patient][:dob],
      gender:    params[:patient][:gender],
      ssn:       params[:patient][:ssn],
      race:      params[:patient][:race],
      ethnicity: params[:patient][:ethnicity]
    )
    patient.phone_numbers_attributes = params[:patient][:phone_numbers_attributes]
    patient.save
    redirect_to patients_path, :flash => { :success => "Patient record updated." }
  end
  # DELETE /patients/1
  def destroy
    patient = Patient.find(params[:id])
    patient.destroy
    redirect_to patients_path, :flash => { :success => "Patient record deleted." }
  end

end