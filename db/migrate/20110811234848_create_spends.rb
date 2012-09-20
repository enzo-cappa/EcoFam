class CreateSpends < ActiveRecord::Migration
  def self.up
    create_table :spends do |t|
      t.string :titulo
      t.decimal :ammount
      t.boolean :done

      t.timestamps
    end
  end

  def self.down
    drop_table :spends
  end
end
