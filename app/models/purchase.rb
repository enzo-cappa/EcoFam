class Purchase < ActiveRecord::Base
  belongs_to :period
  belongs_to :market, inverse_of: :purchases
  has_many :purchase_lines, inverse_of: :purchase, dependent: :destroy
  has_many :products, through: :purchase_lines

  accepts_nested_attributes_for :purchase_lines, allow_destroy: true
  validates :purchase_lines, length: {minimum: 1}
  validates :total, numericality: true
  validates :market_id, presence: true
  validates :period_id, presence: true
  before_validation :update_total

  default_scope -> {order("#{Purchase.table_name}.purchase_date ASC, #{Purchase.table_name}.created_at ASC" )}

  def market_attributes=(market)
    self.market = Market.where(:name => market[:name]).first_or_create
  end

  def purchase_date=(date)
    write_attribute :purchase_date, date
    purchase_date = read_attribute :purchase_date
    period = Period.where(month: purchase_date.month, year: purchase_date.year).first
    self.period = period
  end
  
  private
  def update_total
    return if self.purchase_lines.length == 0
    total = self.purchase_lines.inject(0){|acum, line| acum + line.subtotal}
    self.total =  total
  end
end
