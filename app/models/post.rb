class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: {minimum: 3, maximum:30}
  validates :text, presence: true, length: {minimum: 3, maximum:300}
end
