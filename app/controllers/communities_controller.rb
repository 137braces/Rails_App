class CommunitiesController < ApplicationController
  
    def index
       @communities = Community
       @q = Community.ransack(params[:q])
       @communities = @q.result(distinct: true)
    end
    
    def show
       @q = Community.ransack(params[:q])
    end
    
    def create
       @community = Community.new(community_params)
       @community.save
    end
    
    def info
      @user = current_user
      @community = Community.find(params[:id])
      @users = @community.joins.includes([:user]).map{|join| join.user}
      #@users = @users.find(sex: 0)
      
    end
    
    def game 
      @communities = Community.where(genre: 0 )
      
    end
    def music 
      @communities = Community.where(genre: 1 )
    end
    def love
      @communities = Community.where(genre: 2 )
    end
    def health
      @communities = Community.where(genre: 3 )
    end
    def work
      @communities = Community.where(genre: 4 )
    end
    def animal
      @communities = Community.where(genre: 5 )
    end
    def sport
      @communities = Community.where(genre: 6 )
    end
    def cafe
      @communities = Community.where(genre: 7 )
    end
    def art
      @communities = Community.where(genre: 8 )
    end
    def fashion
      @communities = Community.where(genre: 9 )
    end
    def food
      @communities = Community.where(genre: 10 )
    end
    def travel
      @communities = Community.where(genre: 11 )
    end
  
      
  private  
    
    def community_params
      params.require(:community).permit(:content, :name, :image, :category, :genre)
    end
    
    def set_q
    @q = Community.ransack(params[:q])
    end
    
end
