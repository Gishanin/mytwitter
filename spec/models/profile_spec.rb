require "rails_helper"

RSpec.describe Profile, type: :model do
  it "belongs_to" do
    should belong_to :user
  end

  it "validates nickname presence" do
    should validate_presence_of :nickname
  end

  it "validates nickname length" do
    should validate_length_of :nickname
  end

  it "validates first_name presence" do
    should validate_presence_of :first_name
  end

  it "validates first_name length" do
    should validate_length_of :first_name
  end

  it "validates second_name presence" do
    should validate_presence_of :second_name
  end

  it "validates second_name length" do
    should validate_length_of :second_name
  end

  it "validates age numericality" do
    should validate_numericality_of :age
  end

  it "validates age presence" do
    should validate_presence_of :age
  end
end
