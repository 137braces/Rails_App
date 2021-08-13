class RoomsController < ApplicationController
    
    def send_message
      @user = User.find(params[:id])
      if logged_in?
            #Entry内のuser_idがcurrent_userと同じEntry
            @currentUserEntry = Entry.where(user_id: current_user.id)
            #Entry内のuser_idがMYPAGEのparams.idと同じEntry
            @userEntry = Entry.where(user_id: @user.id)
                #@user.idとcurrent_user.idが同じでなければ
                unless @user.id == current_user.id
                  @currentUserEntry.each do |cu|
                    @userEntry.each do |u|
                      #もしcurrent_user側のルームidと＠user側のルームidが同じであれば存在するルームに飛ぶ
                      if cu.room_id == u.room_id then
                        @isRoom = true
                        @roomId = cu.room_id
                      end
                    end
                  end
                  #ルームが存在していなければルームとエントリーを作成する
                  unless @isRoom
                    @room = Room.new
                    @entry = Entry.new
                  end
                end
      end
    end
    
    
    def index
      @user = current_user
      @currentEntries = current_user.entries
      #@currentEntriesのルームを配列にする
      myRoomIds = []
      @currentEntries.includes([:room]).each do |entry|
        myRoomIds << entry.room.id
      end
      #@currentEntriesのルーム且つcurrent_userでないEntryを新着順で取ってくる
      @anotherEntries = Entry.where(room_id: myRoomIds).where.not(user_id: @user.id).order(created_at: :desc)
    end
    
    def show
      @room = Room.find(params[:id])
        if Entry.where(:user_id => current_user.id, :room_id => @room.id).present?
          @messages = @room.messages.includes(:user)
          @message = Message.new
          @entries = @room.entries.includes(:user)
        else
          redirect_back(fallback_location: root_path)
        end
    end
    
    def create
      @room = Room.create
      #entryにログインユーザーを作成
      @entry1 = Entry.create(:room_id => @room.id, :user_id => current_user.id)
      #entryにparamsユーザーを作成
      @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(:room_id => @room.id))
      redirect_to room_path(@room.id)
    end
end
