class UserMetum < ApplicationRecord

  validates :user, :name, :address, :email, :status, presence: true
  validates :credit_card_number, numericality: { equal_to: 10}
  validates :email, uniqueness: true

  belongs_to :user
end
