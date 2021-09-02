FactoryBot.define do
  factory :community , class: Community do
    name              {"test"}
    content           {" "}
    genre { 0 }
    category { 0 }
    image {"apex.jpg"}
  end
  
end