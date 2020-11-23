class Order < ApplicationRecord
  belongs_to :item
  belongs_to :user

  with_options presence: true do
    validates :quantity, numericality: true 
    validates :item_id, :user_id
  end
end
