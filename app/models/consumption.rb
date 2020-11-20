class Consumption < ApplicationRecord
  belongs_to :item
  belongs_to :user

  with_options presence: true do
    validates :quantity, numericality: true 
    validates :item, :user
  end
end
