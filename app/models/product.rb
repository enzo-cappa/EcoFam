class Product < ActiveRecord::Base
  has_many :purchases, :through => :purchase_line
  has_many :purchase_lines
  belongs_to :variete
  belongs_to :measure_unit

  validates :name, :presence => true, uniqueness: true

  def last_price
    purchase_lines.joins(:purchase).order("purchases.purchase_date DESC").first.price
  end

end
