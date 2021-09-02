class JoinsController < ApplicationController
  before_action :logged_in_user   # ログイン中のユーザーのみに許可（未ログインなら、ログイン画面へ移動）

  # お気に入り登録
  def create
    #if @community.user_id != current_user.id   # 投稿者本人以外に限定
      @community = Community.find(params[:community_id])
      join = @community.joins.new(user_id: current_user.id)
        if join.save
          redirect_to request.referer
        end
    #end
  end
  # お気に入り削除
  def destroy
    @community = Community.find(params[:community_id])
    @join = Join.find_by(user_id: current_user.id, community_id: @community.id)
    @join.destroy
    if @join.delete
          redirect_to request.referer
    end
  end
 
end
