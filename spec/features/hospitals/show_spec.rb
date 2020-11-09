require 'rails_helper'

RSpec.describe "Hospitals/Show", type: :feature do
  before :each do
    @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @doctor1 = @hospital.doctors.create!(name: "Meredith Grey",
                                        specialty: "General Surgery",
                                        university: "Harvard University")
    @doctor2 = @hospital.doctors.create!(name: "Alex Karev",
                                        specialty: "Pediatric Surgery",
                                        university: "John Hopkins University")
    @doctor3 = @hospital.doctors.create!(name: "Miranda Bailey",
                                        specialty: "General Surgery",
                                        university: "Stanford University")
  end

  it "I see the hospitals name and the count of doctors at this hospital" do
    visit "/hospitals/#{@hospital.id}"

    expect(page).to have_content(@hospital.name)
    within("#doctor-count") do
      expect(page).to have_content(3)
    end
  end

  it "I should see a unique list of universities doctors at this hospital attended" do
    visit "/hospitals/#{@hospital.id}"

    expect(page).to have_content(@doctor1.university)
    expect(page).to have_content(@doctor2.university)
    expect(page).to have_content(@doctor3.university)
  end
end
