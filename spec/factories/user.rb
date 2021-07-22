FactoryBot.define do
  factory :user , class: User do
    name              {"test"}
    sequence(:email) { |n| "test#{n}@example.com" }
    password              {"Rails0713"}
    password_confirmation {"Rails0713"}
    sex { '女性' }
    age { '20' }
  end
  
end