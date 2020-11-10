class Organization < ApplicationRecord
  has_secure_password
  has_many :users
  has_many :items

end
