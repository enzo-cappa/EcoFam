FactoryGirl.define do
  factory :purchase_line do
    quantity 1
    date Time.now
    association :product
    association :brand
    association :market
    association :user
    association :user_group
  end
end
