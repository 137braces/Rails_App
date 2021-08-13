require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  let(:user) { FactoryBot.create(:user) }
  
  describe "account_activation" do
    let(:mail) { UserMailer.account_activation(user) }

    context 'アカウント有効化メール' do
      it "メール送信" do
        expect(mail.to).to eq ["test1@example.com"]
        expect(mail.from).to eq ["noreply@example.com"]
        expect(mail.subject).to eq "Account activation"
      end

    it "送信メールのプレビュー" do
        expect(mail.body.encoded).to match user.name
        expect(mail.body.encoded).to match user.activation_token
        expect(mail.body.encoded).to match CGI.escape(user.email)
    end
  end
  end
end