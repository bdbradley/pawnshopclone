FactoryBot.define do
  factory :piece do
    game

  end

  factory :queen, parent: :piece do

  end

  factory :king, parent: :piece do
  end

  factory :bishop, parent: :piece do
  end

  factory :knight, parent: :piece do
  end

  factory :rook, parent: :piece do
  end

  factory :pawn, parent: :piece do
  end

  factory :game do
    association :white_player, factory: :user
    association :black_player, factory: :user
    sequence :name do |n|
      "Game Name #{n}"
    end
  end

  factory :user do
    sequence :name do |n|
      "User Name #{n}"
    end

    sequence :email do |n|
      "dummyEmail#{n}@gmail.com"
    end
    password 'secretPassword'
    password_confirmation 'secretPassword'
  end
end
