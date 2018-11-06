class Order < ApplicationRecord

  validates :user, :tax, :total_price, :status, presence:true

  belongs_to :user
  belongs_to :tax
end
