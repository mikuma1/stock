class CreateConsumptions < ActiveRecord::Migration[6.0]
  def change
    create_table :consumptions do |t|
<<<<<<< Updated upstream
      t.integer :quantity,  null: false
      t.boolean :approval,  null: false, default: false
      t.references :item,   null: false, foreign_key: true
      t.references :user,   null: false, foreign_key: true
=======
      t.integer :quantity,        null: false
      t.boolean :approval,        null: false, default: false
      t.references :item,         null: false, foreign_key: true
      t.references :user,         null: false, foreign_key: true
      t.references :organization, null:false, foreign_key: true
>>>>>>> Stashed changes
      t.timestamps
    end
  end
end
