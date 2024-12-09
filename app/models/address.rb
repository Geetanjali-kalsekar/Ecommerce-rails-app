class Address < ApplicationRecord
  
  belongs_to :profile

  belongs_to :user
  validates :colony, :city, :pincode, :country, presence: true
end
