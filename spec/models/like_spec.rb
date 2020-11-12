require "rails_helper"

RSpec.describe Like, type: :model do
  it "belongs_to user" do
    should belong_to :user
  end

  it "belongs_to post" do
    should belong_to :post
  end
end
