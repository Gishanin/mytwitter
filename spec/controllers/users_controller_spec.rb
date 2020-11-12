require "rails_helper"

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }
  describe "#index" do
    before do
      sign_in user
      get :index
    end
    it { expect(response).to be_successful }
  end

  describe "#follow" do
    context "follow" do
      let(:params) { { id: user.id } }
      before do
        sign_in user
      end

      subject { post :follow, params: { id: user.id } }
      it { expect(subject).to redirect_to(user_path(user)) }
    end
  end

  describe "#unfollow" do
    context "unfollow" do
      let(:second_user) { create(:user) }
      let(:follow) { create(:follow, follower: user, followee: second_user)}
      let(:params) { { id: second_user.id } }
      before do
        follow
        sign_in user
      end

      subject { post :unfollow, params: params }

      it { expect(subject).to redirect_to(user_path(second_user)) }
    end
  end

  describe "#destroy" do
    let(:params) { { id: user.id } }
    before do
      sign_in user
    end

    subject { delete :destroy, params: params }

    it { expect(subject).to be_successful }
  end
end
