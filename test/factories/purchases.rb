FactoryGirl.define do
  factory :purchase do
    total 10
    purchase_date Time.now
    market
    user
    user_group
    before(:create) do |purchase, evaluator|
       purchase.purchase_lines << FactoryGirl.build(:purchase_line)
    end
  end
end


