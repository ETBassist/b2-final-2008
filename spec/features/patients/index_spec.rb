require 'rails_helper'

RSpec.describe "Patients/Index", type: :feature do
  before :each do
    @patient1 = Patient.create!(name: "Katie Bryce",
                                age: 24)
    @patient2 = Patient.create!(name: "Denny Duquette",
                                age: 39)
    @patient3 = Patient.create!(name: "Rebecca Pope",
                                age: 32)
    @patient4 = Patient.create!(name: "Zola Shephard",
                                age: 2)
  end

  it "I see the names of all patients listed from youngest to oldest" do
    visit '/patients'

    within("#patients-by-age") do
      expect(page.all("p")[0]).to have_content(@patient2.name)
      expect(page.all("p")[1]).to have_content(@patient3.name)
      expect(page.all("p")[2]).to have_content(@patient1.name)
      expect(page.all("p")[3]).to have_content(@patient4.name)
    end
  end
end
