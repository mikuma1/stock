class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  has_one_attached :image
  belongs_to :organization
  has_many :consumptions

  with_options presence: true do
    validates :image
    validates :category_id, numericality: { other_than: 0 }
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
