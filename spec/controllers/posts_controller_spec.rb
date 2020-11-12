require "rails_helper"

RSpec.describe PostsController, type: :controller do
  let(:user) { create(:user) }
  describe "#index" do
    context " when successful response" do
      let(:post) { create(:post, user: user) }
      before do
        post
        get :index
      end

      it { expect(response).to be_successful }
    end

    context " when unsuccessful response" do
      before do
        get :index
      end

      it { expect(response).not_to be_successful }
    end
  end

  describe "#create" do
    context "when successful response" do
      let(:params) { { post: { title: "Title", text: "text" } } }

      before do
        sign_in user
      end

      subject { post :create, params: params }

      it { expect(subject).to redirect_to(profile_url) }
    end

    context "when unsuccessful response" do
      let(:params) { { post: { title: "", text: "text" } } }

      before do
        sign_in user
        post :create, params: params
      end

      it { expect(response).not_to be_successful }
    end
  end

  describe "#update"
  context "when successful response" do
    let(:post) { create(:post, user: user) }
    let(:params) { { id: post.id, post: { title: "Title", text: "text" } } }
    before do
      sign_in user
    end

    subject { patch :update, params: params }

    it { expect(subject).to redirect_to(profile_url) }
  end
  describe "#destroy" do
    context "Delete #destroy" do
      let(:post) { create(:post, user: user) }
      let(:params) { { id: post.id } }

      before do
        sign_in user
      end

      subject { delete :destroy, params: params }

      it { expect(subject).to redirect_to(profile_url) }
    end
  end
end
