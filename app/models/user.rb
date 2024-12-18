class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile

 # Devise modules (e.g., database_authenticatable, registerable, etc.)
  
  has_many :address, dependent: :destroy
  has_many :delivery_details, dependent: :destroy
  has_many :products, through: :delivery_details

end
