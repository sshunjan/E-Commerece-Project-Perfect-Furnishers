class Tax < ApplicationRecord
  validates :GST, :PST, presence: true
end
