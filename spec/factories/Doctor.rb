FactoryBot.define do
  factory :doctor do
    first_name { Faker::Name.name }
    second_name  { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6)  }
    phone_number { Faker::PhoneNumber.cell_phone_in_e164 }
    association :specialty, factory: :specialty
    
  end
end