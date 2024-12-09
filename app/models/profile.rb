class Profile < ApplicationRecord
  belongs_to :user
  validates :name, :contact_no, :age, :gender, presence: true
end
