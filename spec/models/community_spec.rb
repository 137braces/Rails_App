require 'rails_helper'

RSpec.describe Community, type: :model do
  describe 'コミュニティ新規作成' do
        it "名前がnilの場合、作成できない" do
           expect(build(:community, name: nil)).to be_invalid
        end
        
        it "contentがnilの場合でも有効" do
           expect(build(:community, content: nil)).to be_valid
        end
       
       it "categoryがnilの場合、作成できない" do
           expect(build(:community, category: nil)).to be_invalid
        end
        
        it "genreがnilの場合、作成できない" do
           expect(build(:community, genre: nil)).to be_invalid
        end
  end
end
