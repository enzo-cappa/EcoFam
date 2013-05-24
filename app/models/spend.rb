class Spend < ActiveRecord::Base
  can_be_tagged
  acts_as_monthly

  validates :titulo, :presence => true
  validates :ammount, :presence => true
  validates :spend_date, :presence => true
  validates :ammount, :numericality => true
end
