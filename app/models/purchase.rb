class Purchase < ActiveRecord::Base
  acts_as_monthly
  
#  attr_accessible :purchase_date, :market_id, :total, :purchase_lines_attributes, :market_attributes
  has_many :products, through: :purchase_line
  has_many :purchase_lines
  belongs_to :market
  accepts_nested_attributes_for :purchase_lines
  validates :purchase_lines, length: {minimum: 1}
  validates :total, numericality: true
  validates :market_id, presence: true
  before_validation :update_total

  def market_attributes=(market)
    self.market = Market.where(:name => market[:name]).first_or_create()
  end

  private
  def update_total
    return if self.purchase_lines.length == 0
    self.total = self.purchase_lines.map(&:subtotal).inject(&:+)
  end
end
