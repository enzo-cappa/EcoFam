require 'test_helper'

class SpendTest < ActiveSupport::TestCase
  test "should not create a spend without ammount" do
    spend = Spend.new(:titulo => "Sin monto", :spend_date => Time.now)
    assert !spend.save
  end
  
  test "should not create a spend without tittle" do
    spend = Spend.new(:ammount => 1, :spend_date => Time.now)
    assert !spend.save
  end
  
  test "should not create a spend without date" do
    spend = Spend.new(:titulo => "nada", :ammount => 1)
    assert !spend.save
  end
  
  test "create a spend" do
    spend = Spend.new(:titulo => "nada", :ammount => 1, :spend_date => Time.now)
    assert spend.save
  end
end
