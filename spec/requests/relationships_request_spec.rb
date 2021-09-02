require 'rails_helper'

RSpec.feature "User_Page", type: :feature do
  let(:user) { create(:user) }
  let(:other_user) { FactoryBot.create(:user) }
  let(:relationship) { user.active_relationships.build(followed_id: other_user.id) }
  let(:relationship) { other_user.active_relationships.build(followed_id: user.id) }
  let(:community) { create(:community) }
  before { user.join(community) } #ユーザーはコミュニティに参加している
  before { other_user.join(community) } #他ユーザーはコミュニティに参加している
  before { user.follow(other_user) }
  before { other_user.follow(user) }
  
  scenario "他のユーザー(other_user)のshow(プロフィール)のテスト" do
    visit_index(user)
    expect(current_path).to eq index_path(user)
    visit user_path(other_user)
    expect(current_path).to eq user_path(other_user)
    expect(page).to have_content other_user.name
    expect(page).to have_selector '.user_icon2'
    expect(page).to have_content community.name
    expect(page).to have_content "すべてを見る"
    expect(page).to have_no_content "Edit"
    expect(user.following.count).to eq(1)
    expect(page).to have_selector '#no-follow'
    find('#no-follow').click
    expect(page).to have_selector '#yes-follow'
    find('#yes-follow').click
  end
  
  scenario "マッチングテスト" do
    visit_matching(user)
    expect(current_path).to eq match_path(user)
    find('#no-follow').click
    expect(page).to have_selector '#yes-follow'
    find('#yes-follow').click
  end
end
