FactoryGirl.define do
  factory :user do
    username 'toby'
    password 'password'

    trait :admin do
      role 'admin'
    end

    trait :non_admin do
      role ''
    end
  end
end
