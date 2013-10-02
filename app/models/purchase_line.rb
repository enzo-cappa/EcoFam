class PurchaseLine < PriceLine
  belongs_to :purchase, inverse_of: :purchase_lines
  
  before_validation :update_subtotal
  before_validation :update_common_attributes

  def price=(price)
    write_attribute :price, price
    update_subtotal
  end

  def quantity=(quantity)
    write_attribute :quantity, quantity
    update_subtotal
  end
  
  private
  def update_subtotal
    write_attribute :subtotal, read_attribute(:price) * read_attribute(:quantity)
  end

  def update_common_attributes
    self.market = self.purchase.market
    self.date = self.purchase.purchase_date
    self.user = self.purchase.user
    self.user_group = self.purchase.user_group
  end
end
