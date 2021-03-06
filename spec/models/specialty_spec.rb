require 'rails_helper'

RSpec.describe Specialty, type: :model do
  it { is_expected.to have_many(:doctors)  }
  it { is_expected.to validate_uniqueness_of(:name)  }
end
