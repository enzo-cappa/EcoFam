FactoryGirl.define do
  factory :market do
    sequence(:name) {|n| "market#{n}" }
  end
end

