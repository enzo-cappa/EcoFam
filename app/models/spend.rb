class Spend < ActiveRecord::Base
  acts_as_taggable

  validates :titulo, :presence => true
  validates :ammount, :presence => true
  validates :date, :presence => true
  validates :ammount, :numericality => true

  default_scope :order => 'date ASC'
  scope :at_month, lambda { |initial_date|    
    where("date between ? and ?", initial_date, initial_date.next_month.beginning_of_month)
  }
  scope :already_done, :conditions => ['done = ?', true]
end
