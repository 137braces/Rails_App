class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  
  def favorite
    @user = User.find(params[:id])
  end
  
  def matcher
    @user = User.find(params[:id])
    @users = @user.matchers
    @followerUsers = @user.followers
  
  end
  
  def index
     if current_user.sex == "男性"
          @users = User.where(activated: true, sex: "女性")
          @q = User.ransack(params[:q])
          @users = @q.result(distinct: true).where(sex: "女性")
          @users = Kaminari.paginate_array(@users).page(params[:page]).per(30)
     elsif current_user.sex == "女性"
          @users = User.where(activated: true, sex: "男性")
          @q = User.ransack(params[:q])
          @users = @q.result(distinct: true).where(sex: "男性")
          @users = Kaminari.paginate_array(@users).page(params[:page]).per(30)
     end

  end
  
  def new
    
  end
  
  def show
    @user = User.find(params[:id])
    redirect_to root_url and return unless @user.activated?
  end
  
  def community_list
    @user = User.find(params[:id])
    @communities = @user.communities.where(category: 0)
    @communities2 = @user.communities.where(category: 1)
    @communities3 = @user.communities.where(category: 2)
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "アカウント認証メールを確認して登録を完了してください。"
      redirect_to root_url
    else
      render 'new'
    end
  end
  

  def edit
    @user = User.find(params[:id])
  end
  

  def update
    @user = User.find(params[:id])
    if @user.update(user_params2)
       redirect_to @user
    else
       render 'edit'
    end
  end
  
 def edit_prf
    @user = User.find(params[:id])
 end
 
 def profile
    @user = User.find(params[:id])
    @communities = @user.communities
 end
 
  #許可された値のみ取得{名前,メールアドレス,パスワード,パスワードの確認}
  private
    
   def user_params
      params.permit(:name, :email, :password,:password_confirmation, :sex, :age, :image)
   end
   
   def user_params2
      params.require(:user).permit(:name, :email, :password,:password_confirmation, :sex, :age, :image, :height,
                    :Body_shape, :blood_type, :residence, :Birthplace, :holiday, :work, :tweet, :content )
   end
    # 正しいユーザーかどうか確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
    
   def search_params
      params.require(:q).permit!
   end
   
end
