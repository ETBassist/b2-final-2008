class Hospital < ApplicationRecord
  has_many :doctors

  def uniq_doctors_universities
    doctors.group(:university).pluck(:university)
  end

  def count_of_doctors
    doctors.count
  end
end
