require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  let!(:user) { create(:user) }
  let(:user_hash_id) { user.hash_id }
  let(:headers) { user.create_new_auth_token }

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

  describe "#update" do
    context "current_userが存在するとき" do
      it "名前が更新されること" do
        expect do
          put api_v1_user_path({ hash_id: user.hash_id }), params: { user: { email: 'hogehoge@example.com' }}, headers: headers
        end.to change { User.last.email }.from('kanikani@example.com').to('hogehoge@example.com')
      end

      it 'ユーザー数は変化しないこと' do
        expect do
          put api_v1_user_path({ hash_id: user.hash_id }), params: { user: { email: 'hogehoge@example.com' }}, headers: headers
        end.to change { User.count }.by(0)
      end

      it "ステータス200を返すこと" do
        put api_v1_user_path({ hash_id: user.hash_id }), params: { user: { email: 'hogehoge@example.com' }}, headers: headers
        expect(response).to have_http_status(200)
      end
    end

    context "current_userが存在しないとき" do
      it "ステータス401を返すこと" do
        put api_v1_user_path({ hash_id: 'hogehoge'}), params: { user: { email: 'hogehoge@example.com' }}, headers: nil
        expect(response).to have_http_status(401)
      end
    end
  end
end
