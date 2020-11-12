require "rails_helper"

RSpec.describe Follow, type: :model do
  it "belongs_to follower" do
    should belong_to :follower
  end

  it "belongs_to followee" do
    should belong_to :followee
  end

  it "validate follower_id" do
    should validate_uniqueness_of(:follower_id).scoped_to(:followee_id)
  end

  it "validate followee_id" do
    should validate_uniqueness_of(:followee_id).scoped_to(:follower_id)
  end
end
