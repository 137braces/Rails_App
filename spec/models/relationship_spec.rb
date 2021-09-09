require 'rails_helper'

RSpec.describe Relationship, type: :model do
  describe "バリデーションテスト" do
    let(:user) { FactoryBot.create(:user) }
    let(:other_user) { FactoryBot.create(:user) }
    let(:relationship) { user.active_relationships.build(followed_id: other_user.id) }

      it "上記のidをuserに紐づけた際、能動的関係が成り立つ" do
        expect(relationship).to be_valid
      end
      
      it "フォロワーidが空の場合、関係性は有効ではない" do
        relationship.follower_id = nil
        expect(relationship).to be_invalid
      end
      
      it "フォローidが空の場合、関係性は有効ではない" do
        relationship.followed_id = nil
        expect(relationship).to be_invalid
      end

  before { user.follow(other_user) }

  describe "フォローとフォロー解除をした際の成功/失敗" do
      it "フォローの成功" do
        expect(user.following?(other_user)).to be_truthy
      end
      
      it "フォロー解除の成功" do
        user.unfollow(other_user)
        expect(user.following?(other_user)).to be_falsy
      end 

      it "自分がフォローしたユーザーのフォロワーに、自分自身が含まれている" do
        expect(other_user.followers.include?(user)).to be_truthy
      end
   end
  end 
end
