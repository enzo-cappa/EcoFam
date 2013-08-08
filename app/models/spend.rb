class Spend < ActiveRecord::Base
  can_be_tagged

  belongs_to :period

  before_save :clear_date_when_needs_confirmation

  validates :titulo, presence: true
  validates :amount, presence: true, numericality: true
  validates :period_id, presence: true

  default_scope -> {order("#{Spend.table_name}.spend_date ASC, #{Spend.table_name}.created_at ASC" )}

  def spend_date=(date)
    write_attribute :spend_date, date
    spend_date = read_attribute :spend_date
    period = Period.where(month: spend_date.month, year: spend_date.year).first
    self.period = period
  end
  
  def needs_confirmation=(needs_confirmation)
    if "1" == needs_confirmation
      #FIXME: Constant string
      self.add_tag("confirmar")
    end
  end

  def needs_confirmation
    self.tags.where(name: "confirmar").length > 0
  end

  def tags_not_confirm
    self.tags.where.not(name: "confirmar")
  end
  private
  
  def clear_date_when_needs_confirmation
    if self.needs_confirmation
      self.spend_date = self.spend_date.end_of_month
    end
  end

  def self.balance(spends)
    spends.inject(0){|acum, spend| acum + spend.amount}
  end
end
