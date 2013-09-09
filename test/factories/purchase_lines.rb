FactoryGirl.define do
  factory :purchase_line do
    quantity 1
    date Time.now
    association :product
    association :brand
    association :market
  end
end
