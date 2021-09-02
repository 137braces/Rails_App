class Community < ApplicationRecord
    belongs_to :user, optional: true
    has_many :joins, dependent: :destroy   
    
    validates :name,  presence: true, length: {maximum: 30}
    validates :content,  presence: false, length: {maximum: 200}
    validates :category,  presence: true
    validates :genre,  presence: true
    
    enum category: {趣味:0,ライフスタイル:1,価値観:2}, _prefix: true
    enum genre: {ゲーム:0,音楽:1,恋愛・結婚:2,美容・健康:3,仕事:4,ペット・動物:5,スポーツ:6,カフェ:7,
                 アート:8,ファッション:9,フード・お酒:10,旅行:11}
    
    def joined_by?(user)
     joins.where(user_id: user).exists?
    end
    
    def unjoined_by?(user)
     joins.where(user_id: user).empty?
    end
end
