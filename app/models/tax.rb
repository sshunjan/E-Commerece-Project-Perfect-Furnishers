class Tax < ApplicationRecord
  validates :GST, :PST, presence: true
  has_many :profiles
end
