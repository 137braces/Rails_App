require 'rails_helper'

RSpec.feature "Community_Page", type: :feature do
  let(:user) { create(:user) }
  let(:community) { create(:community) }
  scenario "コミュニティページの遷移テスト" do
    visit login_path
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログインする"
    expect(current_path).to eq user_path(user)
    expect(page).to have_content user.name
    visit community_path(user)
    
    expect(page).to have_content 'ゲーム'
    expect(page).to have_content '音楽'
    expect(page).to have_content '恋愛・結婚'
    expect(page).to have_content '美容・健康'
    expect(page).to have_content '仕事'
    expect(page).to have_content 'ペット・動物'
    expect(page).to have_content 'スポーツ'
    expect(page).to have_content 'カフェ'
    expect(page).to have_content 'アート'
    expect(page).to have_content 'ファッション'
    expect(page).to have_content 'フード・お酒'
    expect(page).to have_content '旅行'
  end
    
  scenario "各コミュニティのページが存在しているか" do
    visit_community(user)
    visit game_path(user)
    expect(current_path).to eq game_path(user)
    expect(page).to have_selector '.community-grid'
    expect(page).to have_selector 'img'
  
    visit_community(user)
    visit music_path(user)
    expect(current_path).to eq music_path(user)
    expect(page).to have_selector '.community-grid'
    expect(page).to have_selector 'img'
    
    visit_community(user)
    visit love_path(user)
    expect(current_path).to eq love_path(user)
    expect(page).to have_selector '.community-grid'
    expect(page).to have_selector 'img'
    
    visit_community(user)
    visit health_path(user)
    expect(current_path).to eq health_path(user)
    expect(page).to have_selector '.community-grid'
    
    visit_community(user)
    visit work_path(user)
    expect(current_path).to eq work_path(user)
    expect(page).to have_selector '.community-grid'
    
    visit_community(user)
    visit animal_path(user)
    expect(current_path).to eq animal_path(user)
    expect(page).to have_selector '.community-grid'
    
    visit_community(user)
    visit sport_path(user)
    expect(current_path).to eq sport_path(user)
    expect(page).to have_selector '.community-grid'
    
    visit_community(user)
    visit cafe_path(user)
    expect(current_path).to eq cafe_path(user)
    expect(page).to have_selector '.community-grid'
    
    visit_community(user)
    visit art_path(user)
    expect(current_path).to eq art_path(user)
    expect(page).to have_selector '.community-grid'
    
    visit_community(user)
    visit fashion_path(user)
    expect(current_path).to eq fashion_path(user)
    expect(page).to have_selector '.community-grid'
    
    visit_community(user)
    visit food_path(user)
    expect(current_path).to eq food_path(user)
    expect(page).to have_selector '.community-grid'
    
    visit_community(user)
    visit travel_path(user)
    expect(current_path).to eq travel_path(user)
    expect(page).to have_selector '.community-grid'
  end
end
