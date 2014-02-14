class PhoneNumbersController < ApplicationController

  # GET /phone_numbers
  def index
    @phone_numbers = PhoneNumber.all
  end

  # GET /phone_numbers/new
  def new
    @phone_number = PhoneNumber.new
    @patients = Patient.order(:lname)
  end

  # POST /phone_numbers
  def create
    phone_number = PhoneNumber.create(
      areacode:   params[:phone_number][:areacode],
      prefix:     params[:phone_number][:prefix],
      number:     params[:phone_number][:number],
      extension:  params[:phone_number][:extension],
      phtype:     params[:phone_number][:phtype],
      patient_id: params[:phone_number][:patient_id]
    )
    redirect_to phone_numbers_path
  end

  # GET /phone_numbers/1/edit
  def edit
    @phone_number = PhoneNumber.find(params[:id])    
  end

  # PUT /phone_numbers/1
  def update
    phone_number = PhoneNumber.find(params[:id])
    phone_number.update_attributes(
      areacode:   params[:phone_number][:areacode],
      prefix:     params[:phone_number][:prefix],
      number:     params[:phone_number][:number],
      extension:  params[:phone_number][:extension],
      phtype:     params[:phone_number][:phtype]
    )
    redirect_to phone_numbers_path
  end

  # DELETE /phone_numbers/1
  def destroy
    phone_number = PhoneNumber.find(params[:id])
    phone_number.destroy
    redirect_to phone_numbers_path
  end

end