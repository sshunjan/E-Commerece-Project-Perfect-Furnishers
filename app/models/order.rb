class Order < ApplicationRecord

  validates :user, :tax, :total_price, :status, presence:true

  belongs_to :user
  belongs_to :tax
  has_many :ordered_products, dependent: :destroy
  has_many :products, through: :ordered_products, dependent: :destroy
end
