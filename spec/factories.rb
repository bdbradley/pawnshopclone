FactoryBot.define do
  factory :pawn do
    
  end
    factory :user do
      sequence :email do |n|
        "dummyEmail#{n}@gmail.com"
      end
      password "secretPassword"
      password_confirmation "secretPassword"
    end
  end