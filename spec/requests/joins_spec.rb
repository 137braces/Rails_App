require 'rails_helper'

RSpec.feature "Community_Page", type: :feature do
  let(:user) { create(:user) }
  let(:other_user) { FactoryBot.create(:user) }
  let(:community) { create(:community) }
  
  before { other_user.join(community) }
  
  scenario "コミュニティへの参加(join)テスト" do
    visit_community(user)
    visit game_path(user)
    expect(current_path).to eq game_path(user)
    expect(page).to have_selector '.community-grid'
    expect(page).to have_selector 'img'
    visit info_path(community)
    expect(page).to have_content 'このコミュニティに参加する'
    click_link "このコミュニティに参加する"
    expect(user.communities.count).to eq(1)
    expect(current_path).to eq info_path(community)
    expect(page).to have_content 'このコミュニティから退会する'
    click_link "このコミュニティから退会する"
    expect(user.communities.count).to eq(0)
  end
  
  scenario "コミュニティに参加している他のユーザーを確認するテスト" do
    visit_community(user)
    visit game_path(user)
    visit info_path(community)
    expect(page).to have_content other_user.name
    expect(page).to have_content other_user.residence
    visit user_path(other_user)
    expect(page).to have_content other_user.name
  end
  
  #scenario "検索コミュニティのテスト" do
    #visit_community(user)
    #fill_in 'search', with: 'test'
    #find("#q_name_cont").native.send_keys :enter
    #expect(current_path).to eq communities_path
  #end
    
end