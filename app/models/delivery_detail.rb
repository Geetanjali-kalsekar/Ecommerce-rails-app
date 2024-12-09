class DeliveryDetail < ApplicationRecord
  belongs_to :product
  belongs_to :user
  validates :date, presence: true
end
