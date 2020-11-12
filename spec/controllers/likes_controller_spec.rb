require "rails_helper"

RSpec.describe LikesController, type: :controller do

  it "before_action find_post" do
    should use_before_action :find_post
  end
  it "before_action find_like" do
    should use_before_action :find_like
  end
  
  describe "#create" do
    let(:user) { create(:user) }
    let(:user_post) { create(:post, user: user) }

    context "create like" do
      let(:params) { { post_id: user_post.id } }

      before do
        sign_in user
      end

      subject { post :create, params: params }

      it { expect(subject).to redirect_to(root_path) }
    end
  end
end
