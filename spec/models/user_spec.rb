require "rails_helper"

RSpec.describe User, type: :model do
  it "has_one profile" do
    should have_one :profile
  end

  it "has_many posts" do
    should have_many :posts
  end

  it "has_many likes" do
    should have_many :likes
  end

  it "has_many Followed_users" do
    should have_many :followed_users
  end

  it "has_many Followees" do
    should have_many :followees
  end

  it "has_many following_users" do
    should have_many :following_users
  end

  it "has_many followers" do
    should have_many :followers
  end

  it "accepts_nested_attributes_for profile " do
    accept_nested_attributes_for :profile
  end
end
