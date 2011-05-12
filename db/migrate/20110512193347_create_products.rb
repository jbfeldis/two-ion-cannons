class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :title
      t.text :description
      t.integer :quantity
      t.integer :quantity_available
      t.float :price

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
