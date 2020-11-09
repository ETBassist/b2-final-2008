class DoctorPatientsController < ApplicationController
  def destroy
    doctor_patient = DoctorPatient.find_by(patient_id: params[:patient_id])
    doctor_patient.destroy
    redirect_to "/doctors/#{doctor_patient.doctor_id}"
  end
end
