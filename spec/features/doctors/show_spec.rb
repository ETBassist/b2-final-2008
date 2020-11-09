require 'rails_helper'

describe 'As a visitor when I visit a doctors show page' do
  before :each do
    @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @doctor = @hospital.doctors.create!(name: "Meredith Grey",
                                        specialty: "General Surgery",
                                        university: "Harvard University")
    @patient1 = @doctor.patients.create!(name: "Katie Bryce",
                                         age: 24)
    @patient2 = @doctor.patients.create!(name: "Rebecca Pope",
                                         age: 32)
  end

  it "I see that doctors details" do
    visit "/doctors/#{@doctor.id}"

    expect(page).to have_content(@doctor.name)
    expect(page).to have_content(@doctor.specialty)
    expect(page).to have_content(@doctor.university)
  end

  it "I see that doctors hospital and all their patients" do
    visit "/doctors/#{@doctor.id}"

    expect(page).to have_content(@hospital.name)

    within("#patient-#{@patient1.id}") do
      expect(page).to have_content(@patient1.name)
    end

    within("#patient-#{@patient2.id}") do
      expect(page).to have_content(@patient2.name)
    end
  end

  it "I can click a button next to each patients name to take them off that doctors caselod" do
    visit "/doctors/#{@doctor.id}"

    within("#patient-#{@patient1.id}") do
      expect(page).to have_button("Remove From Caseload")
    end

    within("#patient-#{@patient2.id}") do
      click_button("Remove From Caseload")
    end

    expect(current_path).to eq("/doctors/#{@doctor.id}")

    expect(page).to_not have_selector("#patient-#{@patient2.id}")
  end
end
