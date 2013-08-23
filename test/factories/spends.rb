FactoryGirl.define do
  factory :spend do
    titulo "Income"
    amount 9.99
    spend_date {Time.now}
    user_group
    user
  end
end
