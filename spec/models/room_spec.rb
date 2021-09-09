require 'rails_helper'

RSpec.describe Entry, type: :model do
  let(:user) { create(:user) }
  let(:room) { create(:room) }
  let(:entry) { create(:entry, user_id: user.id, room_id: room.id) }
      describe 'roomモデルの単体テスト' do
          it "roomの有効性" do
            expect(room).to be_valid
          end
          
         it "roomの名前(:name)がnilでも有効" do
            room.name = nil
            expect(room).to be_valid
         end
        
      end
end
