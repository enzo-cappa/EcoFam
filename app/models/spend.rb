class Spend < ActiveRecord::Base
  can_be_tagged

  validates :titulo, :presence => true
  validates :ammount, :presence => true
  validates :spend_date, :presence => true
  validates :ammount, :numericality => true

  default_scope :order => 'spend_date ASC, created_at ASC'
  scope :at_month, lambda { |initial_date|    
    where("spend_date between ? and ?", initial_date, initial_date.next_month.beginning_of_month)
  }
end
