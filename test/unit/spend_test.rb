require 'test_helper'

class SpendTest < ActiveSupport::TestCase
  test "should not create a spend without amount" do
    spend = Spend.new(:titulo => "Sin monto", :spend_date => Time.now)
    assert !spend.save
  end
  
  test "should not create a spend without tittle" do
    spend = Spend.new(:amount => 1, :spend_date => Time.now)
    assert !spend.save
  end
  
  test "should not create a spend without date" do
    spend = Spend.new(:titulo => "nada", :amount => 1)
    assert !spend.save
  end
  
  test "should have a period" do
    spend = Spend.new(:titulo => "nada", :amount => 1, :spend_date => Time.now)
    assert !spend.save
  end

  test "should change period when changing date" do
    time_one = Time.now
    time_two = time_one + 1.month
    Period.where(month: time_one.month, year: time_one.year).first_or_create
    Period.where(month: time_two.month, year: time_two.year).first_or_create
    
    spend = Spend.create(:titulo => "nada", :amount => 1, :spend_date => time_one)
    spend.period = periods(:one)
    assert spend.save
    period_one = spend.period

    spend.spend_date = time_two
    period_two = spend.period
    assert spend.save

    assert_not_equal period_one.id, period_two.id
  end

  test "should calculate balance" do
    period = periods :one
    spend = spends :one
    spend.period = period
    spend.amount = 10
    spend.save
    assert_equal Spend.balance(period.spends), 10
  end
end
