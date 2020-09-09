class Profile < ApplicationRecord
  belongs_to :user

  validates :nickname, length: { maximum: 16, minimum: 3 }, presence: true
  validates :first_name, length: { maximum: 16, minimum: 3 }, presence: true
  validates :second_name, length: { maximum: 16, minimum: 3 }, presence: true
  validates :age, numericality: { greater_than_or_equal_to: 12 }
end
