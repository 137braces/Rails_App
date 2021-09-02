require 'rails_helper'

RSpec.describe Join, type: :model do
  let(:user) { create(:user) }
  let(:community) { create(:community) }
  let(:join) { create(:join, user_id: user.id, community_id: community.id) }
      describe 'ユーザー新規作成' do
          it "userが関係が成り立つ" do
            expect(join).to be_valid
          end
          
          it "コミュニティ参加の成功" do
            expect(user.join(community)).to be_truthy
          end
          
          it "コミュニティ参加数" do
            user.join(community)
            expect(user.communities.count).to eq(1)
          end
          
          it "コミュニティ参加数" do
            user.not_join(community)
            expect(user.communities.count).to eq(0)
          end
          
      end
end

