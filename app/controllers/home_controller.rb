class HomeController < ApplicationController
  def index
    if params[:letter]
      @patients = Patient.by_letter(params[:letter])
    else
      @patients = Patient.order(:lname)
    end
  end
end