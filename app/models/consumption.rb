class Consumption < ApplicationRecord
  belongs_to :item
  belongs_to :user
  belongs_to :organization

  with_options presence: true do
    validates :quantity, numericality: true
    validates :item_id, :user_id, :organization_id
  end
end
