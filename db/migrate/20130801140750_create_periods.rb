class CreatePeriods < ActiveRecord::Migration
  class Period < ActiveRecord::Migration
  end
  
  def change
    create_table :periods do |t|
      t.integer :year
      t.integer :month

      t.timestamps
    end
    add_index :periods, [:year, :month], unique: true 
  end
end
