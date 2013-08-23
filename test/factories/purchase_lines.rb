FactoryGirl.define do
  factory :purchase_line do
    quantity 1
    association :product
    association :brand
  end
end
