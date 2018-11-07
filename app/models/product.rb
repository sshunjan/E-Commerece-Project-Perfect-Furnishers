class Product < ApplicationRecord
  validates :name, :description, :category,  presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 1}
  validates :name, uniqueness:true

  belongs_to :category
  has_many :ordered_products, dependent: :destroy
  has_many :orders, through: :ordered_products, dependent: :destroy

  mount_uploader :image, ImageUploader
end
