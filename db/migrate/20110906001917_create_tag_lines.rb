class CreateTagLines < ActiveRecord::Migration
  def self.up
    create_table :tag_lines do |t|
      t.integer :tag_id
      t.integer :taggable_id
      t.string  :taggable_type

      t.timestamps
    end
  end

  def self.down
    drop_table :tag_lines
  end
end
