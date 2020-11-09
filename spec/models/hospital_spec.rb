require 'rails_helper'

describe Hospital, type: :model do
  describe 'relationships' do
    it { should have_many :doctors }
  end

  describe 'instance methods' do
    it '#uniq_doctors_universities' do
      hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      doctor1 = hospital.doctors.create!(name: "Meredith Grey",
                                          specialty: "General Surgery",
                                          university: "Harvard University")
      doctor2 = hospital.doctors.create!(name: "Alex Karev",
                                         specialty: "Pediatric Surgery",
                                         university: "John Hopkins University")
      doctor3 = hospital.doctors.create!(name: "Miranda Bailey",
                                          specialty: "General Surgery",
                                          university: "Stanford University")
      expected = [doctor1.university, doctor2.university, doctor3.university]

      expect(hospital.uniq_doctors_universities).to eq(expected)
    end
  end
end
