class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :city
      t.string :zipcode
      t.text :description
      t.integer :sold_items_count

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
