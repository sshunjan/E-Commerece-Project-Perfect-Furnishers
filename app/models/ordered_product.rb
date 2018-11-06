class OrderedProduct < ApplicationRecord

  validates :product, :order, :quantity, :price, presence: true
  validates :quantity, numericality: {greater_than: 0}

  belongs_to :product
  belongs_to :order
end
