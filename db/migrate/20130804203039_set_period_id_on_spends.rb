class SetPeriodIdOnSpends < ActiveRecord::Migration
  class Spend < ActiveRecord::Base    
  end

  class Period < ActiveRecord::Base
  end
  
  def change
    reversible do |dir|
      dir.up {
        spends = Spend.all
        for spend in spends
          period = Period.where(month: spend.spend_date.month, year: spend.spend_date.year).first
          spend.period_id = period.id
          spend.save
        end
      }
    end
  end
  
end
