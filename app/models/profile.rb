class Profile < ApplicationRecord
  has_many :addresses, dependent: :destroy
  belongs_to :user
  validates :name, :contact_no, :age, :gender, presence: true
end
