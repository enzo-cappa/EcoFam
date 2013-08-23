FactoryGirl.define do
  factory :brand do
    sequence(:name) {|n| "brand#{n}" }
  end
end

