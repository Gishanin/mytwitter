require "rails_helper"

RSpec.describe ProfileController, type: :controller do
  it "before_action get_user_profile" do
    should use_before_action :get_user_profile
  end

  let(:user) { create(:user) }
  let(:post) { create(:post, user: user) }
  let(:profile) { create(:profile, user: user) }

  describe "#show" do
    context "show must be successeful" do
      before do
        sign_in user
        post
        get :show
      end
      it { expect(response).to be_successful }
    end
  end
  describe "#update" do
    context "when successful response" do
      let(:params) { { id: user.id, profile: { nickname: "MyNickname", first_name: "MyfirstName", second_name: "MySecondName", age: "25" } } }
      before do
        sign_in user
        profile
      end

      subject { patch :update, params: params }

      it { expect(subject).to redirect_to(profile_url) }
    end
  end
end
