require "rails_helper"

RSpec.describe HomeController, type: :controller do
  it "before_action check_current_user" do
    should use_before_action :check_current_user
  end
  let(:user) { create(:user) }
  describe "#index" do
    context "Get #index" do
      before do
        sign_in user
        get :index
      end
      it { expect(response).to redirect_to(posts_url) }
    end
    context "not redirect" do
      before do
        get :index
      end
      it { expect(response).not_to redirect_to(posts_url) }
    end
  end
end
