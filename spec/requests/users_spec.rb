require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  let(:user) { create(:user) }
  let(:user_hash_id) { user.hash_id }

  describe "#show" do
    context "ユーザーが存在するとき" do
      it 'ステータス200を返すこと' do
        get api_v1_user_path(hash_id: user_hash_id)
        expect(response).to have_http_status(200)
      end
    end

    context "ユーザーが存在しないとき" do
      it "ステータス404を返すこと" do
        get api_v1_user_path(hash_id: 'hogehoge')
        expect(response).to have_http_status(404)
      end
    end
  end
end
