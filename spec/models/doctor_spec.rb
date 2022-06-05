require 'rails_helper'

RSpec.describe Doctor, type: :model do
  it { is_expected.to belong_to(:specialty)  }
  it { is_expected.to validate_presence_of 'first_name'}
  it { is_expected.to validate_presence_of 'second_name'}
  it { is_expected.to validate_presence_of 'phone_number'}
  describe "phone number" do
    before(:each) do
      @doctor = FactoryBot.create(:doctor)
    end
    it 'phone number match regexp' do
  
      expect(@doctor.phone_number).to match(/\+\d{12}/)
    end
  end
  
end
