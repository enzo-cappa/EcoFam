FactoryGirl.define do
  factory :product do
    sequence(:name) {|n| "product#{n}" }
  end
end
