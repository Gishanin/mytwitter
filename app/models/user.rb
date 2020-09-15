class User < ApplicationRecord
  has_one :profile, dependent: :destroy
  has_many :posts
  
  has_many :likes, dependent: :destroy
  
  accepts_nested_attributes_for :profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
