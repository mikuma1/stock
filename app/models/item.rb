class Item < ApplicationRecord
  has_one_attached :image

  with_options presence: true do
    validates :category_id, :image
    validates :url, length: { maximum: 300 }
    with_options length: { maximum: 40 } do
      validates :name
      validates :place
    end
    with_options numericality: true do
      with_options length: { maximum: 6 } do
        validates :stock_quantity
        validates :standard_inventory
        validates :ordering_unit
      end
      validates :price
    end
  end
end
