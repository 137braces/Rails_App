FactoryBot.define do
  factory :user , class: User do
    name              {"test"}
    sequence(:email) { |n| "test#{n}@example.com" }
    password              {"Rails0713"}
    password_confirmation {"Rails0713"}
    sex { '女性' }
    age { '20' }
    image { 'woman.jpg' }
    residence { '大阪' }
    Birthplace { '大阪' }
    Body_shape { 'ぽっちゃり' }
    blood_type { 'B型' }
    height { '173cm' }
    work { '上場企業' }
    holiday { '土日' }
    content { 'はじめまして' }
    tweet { 'こんにちは' }
    activated { true }
    activated_at { Time.zone.now }
    
  
    trait :no_activated do
        activated { false }
        activated_at { nil }
    end
  end
end