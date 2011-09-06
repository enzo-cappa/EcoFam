class Spend < ActiveRecord::Base
  can_be_tagged

  validates :titulo, :presence => true
  validates :ammount, :presence => true
  validates :date, :presence => true
  validates :ammount, :numericality => true

  default_scope :order => 'date ASC, created_at ASC'
  scope :at_month, lambda { |initial_date|    
    where("date between ? and ?", initial_date, initial_date.next_month.beginning_of_month)
  }
  scope :already_done, :conditions => ['done = ?', true]
end
