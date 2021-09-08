require 'rails_helper'

RSpec.describe Entry, type: :model do
  let(:user) { create(:user) }
  let(:room) { create(:room) }
  let(:entry) { create(:entry, user_id: user.id, room_id: room.id) }
      describe 'entryモデルの単体テスト' do
          it "entryの有効性" do
            expect(entry).to be_valid
          end
          
         it "user_idが空の場合、entryは成立しない" do
            entry.user_id = nil
            expect(entry).to be_invalid
         end
         
         it "room_idが空の場合、entryは成立しない" do
            entry.room_id = nil
            expect(entry).to be_invalid
         end
      
      end
end