require 'rails_helper'

RSpec.feature 'ログインとログアウト' do
  background do
    # ユーザを作成する
    @user = create(:user)
  end
  scenario 'ログインする' do
    # トップページを開く
    visit login_path
    # ログインフォームにEmailとパスワードを入力する
    fill_in name = "session_email", with: @user.email
    fill_in 'session_password', with: @user.password
    # ログインボタンをクリックする
    click_on 'Log in'
    # ログインに成功したことを検証する
    expect(page).to have_title ''
  end
end