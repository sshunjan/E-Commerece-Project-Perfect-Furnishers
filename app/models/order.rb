class Order < ApplicationRecord
  validates :user, :total_price, :status_type_id , presence:true

  belongs_to :user
  has_many :ordered_products, dependent: :destroy
  has_many :products, through: :ordered_products, dependent: :destroy
end
