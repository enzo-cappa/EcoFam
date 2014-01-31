class SetDateAndMarketToPriceLine < ActiveRecord::Migration

  class PurchaseLine < PriceLine
    belongs_to :purchase, inverse_of: :purchase_lines
  end
  
  def change
    reversible do |dir|
      dir.up {
        purchase_lines = PurchaseLine.all
        purchase_lines.each do |line|
          line.date = line.purchase.purchase_date
          line.market = line.purchase.market
          line.save!
        end
      }
    end
  end
end
