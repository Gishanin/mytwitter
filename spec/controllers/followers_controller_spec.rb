require "rails_helper"

RSpec.describe FollowersController, type: :controller do
  let(:user) { create(:user) }

  it "before_action check_current_user" do
    should use_before_action :get_user_followers
  end

  describe "#index" do
    context "all user followers" do
      let(:params) { { id: user.id } }
      before do
        sign_in user
        get :index, params: params
      end
      it { expect(response).to be_successful }
    end
  end
end
