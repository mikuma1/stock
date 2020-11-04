class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,               null: false
      t.text :info
      t.integer :category_id,       null: false
      t.text :url,                null: false
      t.integer :stock_quantity,    null: false
      t.integer :standard_inventory,null: false
      t.integer :ordering_unit,     null: false
      t.integer :price,             null: false
      t.string :place,              null: false
      t.timestamps
    end
  end
end
