class AddDefaultPeriodInstances < ActiveRecord::Migration
  class Period < ActiveRecord::Base
  end
  
  def change
    reversible do |dir|
      for year in 2010..2020
        for month in 1..12
          dir.up{Period.create({year: year, month: month})}
        end
      end
    end
  end
end
