class Purchase < ActiveRecord::Base
  belongs_to :period
  
  has_many :products, through: :purchase_line
  has_many :purchase_lines
  belongs_to :market
  accepts_nested_attributes_for :purchase_lines
  validates :purchase_lines, length: {minimum: 1}
  validates :total, numericality: true
  validates :market_id, presence: true
  validates :period_id, presence: true
  before_validation :update_total

  def market_attributes=(market)
    self.market = Market.where(:name => market[:name]).first_or_create()
  end

  def purchase_date=(date)
    write_attribute :purchase_date, date
    puchase_date = read_attribute :purchase_date
    period = Period.where(month: purchase_date.month, year: purchase_date.year).first
    self.period = period
  end
  
  private
  def update_total
    puts "updating total"
    return if self.purchase_lines.length == 0
    puts "total updated"
    #total =  self.purchase_lines.map(&:subtotal).inject(&:+)
    total = self.purchase_lines.inject(0){|acum, line| acum + line.subtotal}
    puts "Total: #{total}"
    self.total =  total
  end
end
