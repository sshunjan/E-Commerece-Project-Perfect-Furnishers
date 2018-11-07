class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  mount_uploader :icon, IconUploader
end
