class OrderedProduct < ApplicationRecord

  validates :product_id, :order_id, :quantity, :price, presence: true
  validates :quantity, numericality: {greater_than: 0}

  belongs_to :product
  belongs_to :order
end
