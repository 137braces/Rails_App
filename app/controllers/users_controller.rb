class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]
  before_action :correct_user,   only: [:edit, :update]
  
  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).where(sex: "女性")
  end
  
  
  #def search
    # @search_params = user_search_params
     #@users = User.search(@search_params).includes(:age, :height, :Body_shape, :blood_type, :residence, :Birthplace, :holiday, :Sociability)
  #end
  
  def personality
    @user = User.find(params[:id])
  end
  
  def new
  end
  
  def show
    @user = User.find(params[:id])
   # @microposts = @user.microposts.paginate(page: params[:page])

  end
  
  def create
    @user = User.new(user_params)
    @user.image = "default_icon.jpg"
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
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
  
 
 def message
    @user = User.find(params[:id])
 end
 
 def profile
    @user = User.find(params[:id])
 end
 
 def from_opponent
    @user = User.find(params[:id])
 end
  #許可された値のみ取得{名前,メールアドレス,パスワード,パスワードの確認}
  private
    
   def user_params
      params.permit(:name, :email, :password,:password_confirmation, :sex, :age, :image)
   end
   
   def user_params2
      params.require(:user).permit(:name, :email, :password,:password_confirmation, :sex, :age, :image, :height,
                    :Body_shape, :blood_type, :residence, :Birthplace, :holiday, :work )
   end
    # 正しいユーザーかどうか確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    
   def search_params
      params.require(:q).permit!
   end
end
