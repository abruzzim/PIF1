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
  end
  # GET /patients/new
  def new
    @patient = Patient.new
    # %w(Home Office Mobile).each do |phone_number_type|
    #   @patient.phone_numbers.build(phtype: phone_number_type)
    # end
  end
  # POST /patients
  def create
    # @patient = Patient.new
    # @patient.fname     = params[:fname]
    # @patient.lname     = params[:lname]
    # @patient.dob       = params[:dob]
    # @patient.gender    = params[:gender]
    # @patient.ssn       = params[:ssn]
    # @patient.race      = params[:race]
    # @patient.ethnicity = params[:ethnicity]

    Patient.create(
      fname:     params[:fname],
      lname:     params[:lname],
      dob:       params[:dob],
      gender:    params[:gender],
      ssn:       params[:ssn],
      race:      params[:race],
      ethnicity: params[:ethnicity]
    )

    # params["patient"]["phone_numbers_attributes"].each do |phone_number_attributes|
    #   @patient.phone_numbers << phone_number_attributes
    # end

    # @patient.save

    redirect_to patients_path, :flash => { :success => "Patient record created." }
  end
  # GET /patients/1/edit
  def edit
    @patient = Patient.find(params[:id])
  end
  # PUT /patients/1
  def update
    patient = Patient.find(params[:id])
    patient.update_attributes(
      fname:     params[:fname],
      lname:     params[:lname],
      dob:       params[:dob],
      gender:    params[:gender],
      ssn:       params[:ssn],
      race:      params[:race],
      ethnicity: params[:ethnicity]
    )
    redirect_to patients_path, :flash => { :success => "Patient record updated." }
  end
  # DELETE /patients/1
  def destroy
    patient = Patient.find(params[:id])
    patient.destroy
    redirect_to patients_path, :flash => { :success => "Patient record deleted." }
  end

end