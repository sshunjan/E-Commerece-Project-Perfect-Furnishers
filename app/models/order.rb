class Order < ApplicationRecord
  validates :user_id , :total_price, :status_type_id , presence:true

  belongs_to :user
  belongs_to :status_type

  has_many :ordered_products, dependent: :destroy
  has_many :products, through: :ordered_products, dependent: :destroy
  accepts_nested_attributes_for :ordered_products

end
