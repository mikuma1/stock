class Organization < ApplicationRecord
  has_secure_password
  has_many :users
  has_many :items
  has_many :consumptions

  validates :name, presence: true, uniqueness: { allow_blank: true, case_sensitive: true }
  validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }, length: { minimum: 6 }
end
