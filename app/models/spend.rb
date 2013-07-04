class Spend < ActiveRecord::Base
  attr_accessible :spend_date, :titulo, :amount
  
  can_be_tagged
  acts_as_monthly

  validates :titulo, :presence => true
  validates :amount, :presence => true
  validates :spend_date, :presence => true
  validates :amount, :numericality => true
end
