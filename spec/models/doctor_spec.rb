require 'rails_helper'

describe Doctor, type: :model do
  describe 'relationships' do
    it { should belong_to :hospital }
  end
end