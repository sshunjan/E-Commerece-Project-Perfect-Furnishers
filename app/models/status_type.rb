class StatusType < ApplicationRecord
  validates :name, uniqueness: true
  has_many :products
  has_many :orders
end
