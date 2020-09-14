class Post < ApplicationRecord
  belongs_to :user

  has_many :likes, dependent: :destroy
  
  validates :title, presence: true, length: {minimum: 3, maximum:30}
  validates :text, presence: true, length: {minimum: 3, maximum:300}
end
