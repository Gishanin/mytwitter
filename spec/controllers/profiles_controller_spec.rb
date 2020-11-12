require "rails_helper"

RSpec.describe ProfilesController, type: :controller do
  let(:user) { create(:user) }
  let(:second_user) { create(:user) }
  let(:post) { create(:post, user: second_user) }
  let(:profile) { create(:profile, user: second_user) }

  it "before_action get_user_profile" do
    should use_before_action :get_user_profile
  end

  describe "#index" do
    context "index must be successeful" do
      before do
        sign_in user
        profile
        post
        get :index
      end

      it { expect(response).to be_successful }
    end
  end

  describe "#show" do
    context "show must be successeful" do      
      before do
        sign_in user
        profile
        post
        get :show, params: params
      end
      let(:params) { { id: profile.id } }

      it { expect(response).to be_successful }
    end
  end
end
