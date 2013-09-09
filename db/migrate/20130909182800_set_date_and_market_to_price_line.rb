class SetDateAndMarketToPriceLine < ActiveRecord::Migration
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
