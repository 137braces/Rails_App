require 'rails_helper'

RSpec.feature "SignUps", type: :feature do
  include ActiveJob::TestHelper
  let!(:user) { FactoryBot.build(:user) }
  scenario "ユーザーはサインアップに成功する" do
    visit root_path
    click_link "新規登録"

    perform_enqueued_jobs do
      expect {
        fill_in "ニックネーム",              with: user.name
        fill_in "メールアドレス",     with: user.email
        fill_in "パスワード",         with: user.password
        fill_in "パスワード確認",  with: user.password
        select "男性", from: "sex"
        select "25歳", from: "age"
        
        click_button "新規作成をする"
      }.to change(User, :count).by(1)
        expect(current_path).to eq root_path
        expect(page).to have_content "アカウント認証メールを確認して登録を完了してください。"
    end
   mail = ActionMailer::Base.deliveries.last

    aggregate_failures do
      expect(mail.to).to eq [user.email]
      expect(mail.from).to eq ["noreply@example.com"]
      expect(mail.subject).to eq "Account activation"
    end
  end
end