require "rails_helper"

RSpec.describe Post, type: :model do
  it "has_many" do
    should have_many :likes
  end

  it "belongs_to" do
    should belong_to :user
  end

  it "validates text" do
    should validate_presence_of :text
  end

  it "validates text" do
    should validate_length_of :text
  end

  it "validates title" do
    should validate_presence_of :title
  end

  it "validates title" do
    should validate_length_of :title
  end
end
