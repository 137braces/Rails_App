require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規作成' do
      context 'ユーザーネーム' do
        it "名前が空白(nil)の場合、登録できない" do
           expect(build(:user, name: nil)).to be_invalid include("can't be blank")
        end
    
        it "名前が11文字以上の場合、登録できない" do
           expect(build(:user, name: "x" * 11)).to be_invalid
        end
        it "名前が1文字の場合、登録が可能" do
           expect(build(:user, name: "x")).to be_valid
        end
        it "名前が10文字以下の場合、登録が可能" do
           expect(build(:user, name: "x" * 10)).to be_valid
        end
      end
      
      context 'パスワード' do
        it "パスワードが(8文字以上で大文字と小文字、半角数字を1文字以上を含める)" do
           expect(build(:user,password: "Rails0713", password_confirmation: "Rails0713")).to be_valid
        end
        
        it "パスワードが空白(nil)の場合、登録できない" do 
           expect(build(:user, password: nil, password_confirmation: nil)).to be_invalid
        end 
        it "パスワードが7文字以下の場合、登録ができない" do
           expect(build(:user,password: "Rails07", password_confirmation: "Rails07")).to be_invalid
        end
    
        it "パスワードに『大文字』が存在しない場合、登録ができない" do
          expect(build(:user,password: "rails0713", password_confirmation: "rails0713")).to be_invalid
        end
    
       it "パスワードに『数字』が存在しない場合、登録ができない" do
          expect(build(:user,password: "Appleapple", password_confirmation: "Appleapple")).to be_invalid
       end
       it "パスワードが暗号化されているか" do 
          @user = create(:user)
          expect(@user.password_digest).to_not eq "Raild0713"   
       end 
    
      end
      
      context 'メールアドレス' do
        it "メールアドレスが重複している場合、登録ができない" do
           @user = create(:user,email: "taro@example.com")
           expect(build(:user,email: @user.email)).to be_invalid
        end
        it "メールアドレスが空白(nil)の場合、登録できない" do 
           expect(build(:user, email: nil)).to be_invalid
        end 
      end
      
      context '性別' do
        it "性別が選択(nil)の場合、登録ができない" do
           @user = build(:user, sex: nil)
           expect(@user).to be_invalid
        end
      end
    
  end
end

