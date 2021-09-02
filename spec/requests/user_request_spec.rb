require 'rails_helper'

RSpec.feature "User_Page", type: :feature do
  let(:user) { create(:user) }
  let(:other_user) { FactoryBot.create(:user) }
  let(:community) { create(:community) }
  before { user.join(community) } #ユーザーはコミュニティに参加している
  before { other_user.join(community) } #他ユーザーはコミュニティに参加している
  scenario "show(プロフィール)のテスト" do
    visit login_path
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログインする"
    expect(current_path).to eq user_path(user)
    expect(page).to have_content user.name
    expect(page).to have_selector '.user_icon2'
    expect(page).to have_content community.name
    expect(page).to have_content "すべてを見る"
    expect(page).to have_content "Edit"
    
    #プロフィール項目一覧
    expect(page).to have_selector 'td', text: user.name
    expect(page).to have_selector 'td', text: user.age
    expect(page).to have_selector 'td', text: user.residence
    expect(page).to have_selector 'td', text: user.Birthplace
    expect(page).to have_selector 'td', text: user.height
    expect(page).to have_selector 'td', text: user.Body_shape
    expect(page).to have_selector 'td', text: user.blood_type
    expect(page).to have_selector 'td', text: user.work
    expect(page).to have_selector 'td', text: user.holiday
    expect(page).to have_selector 'p', text: user.content
    
    #プロフィールの編集
    expect(page).to have_field 'つぶやき', with: user.tweet
    expect(page).to have_field '自己紹介', with: user.content
    expect(page).to have_select('身長', selected: '173cm')
    expect(page).to have_select('体型', selected: 'ぽっちゃり')
    expect(page).to have_select('血液型', selected: 'B型')
    expect(page).to have_select('居住地', selected: '大阪')
    expect(page).to have_select('出身地', selected: '大阪')
    expect(page).to have_select('休日', selected: '土日')
    expect(page).to have_select('職業', selected: '上場企業')
    
  end
  
  scenario "index(他のユーザー一覧)のテスト" do
    visit_index(user)
    expect(current_path).to eq index_path(user)
    expect(page).to have_content other_user.age
    expect(page).to have_content other_user.residence
    
    #gem kaminariによるページネーションテスト
    expect{ find_link('2', rel="next").click }
    expect{ find_link('1', rel="prev").click }
    expect{ find_link('最後', ".page-link").click }
    expect{ find_link('最初', ".page-link").click }
  end
  
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
    expect(user.following.count).to eq(0)
    expect(page).to have_selector '#yes-follow'
    find('#yes-follow').click
    expect(page).to have_selector '#no-follow'
    find('#no-follow').click
  end
end