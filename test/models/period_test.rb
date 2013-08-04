require 'test_helper'

class PeriodTest < ActiveSupport::TestCase
  test "year and month combination should be unique" do
    Period.create(month: 12, year: 12)
    period2 = Period.new(month: 12, year: 12)
    assert !period2.save
  end

  test "year should be numeric" do
    period2 = Period.new(month: 12, year: "a")
    assert !period2.save
  end
  
  test "year can't be negative" do
    period2 = Period.new(month: 12, year: -12)
    assert !period2.save
  end

  test "year can't be float" do
    period2 = Period.new(month: 12, year: 1.3)
    assert !period2.save
  end

  test "month should be numeric" do
    period2 = Period.new(month: "a", year: 12)
    assert !period2.save
  end
  
  test "month can't be negative" do
    period2 = Period.new(month: -12, year: 12)
    assert !period2.save
  end

  test "month can't be float" do
    period2 = Period.new(month: 11.2, year: 12)
    assert !period2.save
  end

  test "month should be less than 13" do
    period2 = Period.new(month: 13, year: 12)
    assert !period2.save
  end
end
