class Product < ApplicationRecord
  validates :name, :description, :category,  presence: true
  validates :price, presence: true, numericality: { greater_than: 0}
  validates :name, uniqueness:true

  belongs_to :category
end
