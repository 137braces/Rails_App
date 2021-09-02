class User < ApplicationRecord
  has_many :joins, dependent: :destroy
  has_many :communities,through: :joins
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :rooms, through: :entries
  has_many :active_relationships, class_name:  "Relationship", foreign_key: "follower_id", dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship", foreign_key: "followed_id", dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  
  
  attr_accessor :remember_token, :activation_token
  before_save   :downcase_email
  before_create :create_activation_digest
  
  mount_uploader :image, ImageUploader
  
  #ユーザー名は２文字以上、10文字以下
  validates :name,  presence: true, length: {maximum: 30}
  validates :content,  presence: false
  validates :tweet,  presence: false, length: {maximum: 40}
  
  #『メールアドレス関連』
  before_save { self.email = email.downcase } #認証前に全ての文字を小文字に変換
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 
  validates :email, presence: true, length: { maximum: 100 },
  format: { with: VALID_EMAIL_REGEX }, #フォーマットの検証
  uniqueness: true  #一意性の検証(大文字・小文字の区別)
  
  #『パスワード関連』
  has_secure_password #パスワードをハッシュ化
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{8,}\z/
  validates :password, presence: true,
  format: { with: VALID_PASSWORD_REGEX }, allow_nil: true
  
  validates :age,  presence: true
  
  enum sex: { 男性: 0, 女性: 1 }
  validates :sex,
    presence: true,
    inclusion: { in: proc { sexes.keys } }
    
  
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  # ランダムなトークンを返す
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  
  def authenticated?(remember_token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end
  
  def forget
    update_attribute(:remember_digest, nil)
  end
  
  

  def activate
    update_columns(activated: FILL_IN, activated_at: FILL_IN)
  end


  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end
  

  def follow(other_user)
    following << other_user
  end

 
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    following.include?(other_user)
  end
  
  
  def matchers
    following & followers
  end
  
  
  def join(community)
    joins.find_or_create_by(community_id: community.id)
  end
  
  def not_join(community)
    joins.delete_by(community_id: community.id)
  end
  
 

  private

    # メールアドレスをすべて小文字にする
    def downcase_email
      self.email = email.downcase
    end

    # 有効化トークンとダイジェストを作成および代入する
    def create_activation_digest
      self.activation_token  = User.new_token
      self.activation_digest = User.digest(activation_token)
    end
    
  
  enum Body_shape: { スリム: 0, やや細め: 1, 普通: 2, グラマー: 3, 筋肉質:4, ややぽっちゃり:5, ぽっちゃり:6 }, _prefix: true
  
  enum residence: {北海道:0,青森:1,岩手:2,宮城:3,秋田:4,山形:5,福島:6,
                    茨城:7,栃木:8,群馬:9,埼玉:10,千葉:11,東京:12,神奈川:13,
                    新潟:14,富山:15,石川:16,福井:17,山梨:18,長野:19,岐阜:20,
                    静岡:21,愛知:22,三重:23, 滋賀:24,京都:25,大阪:26,兵庫:27,
                   奈良:28,和歌山:29,鳥取:30,島根:31,岡山:32,広島:33,山口:34,
                    徳島:35,香川:36,愛媛:37,高知:38,福岡:39,佐賀:40,長崎:41,
                    熊本:42,大分:43,宮崎:44,鹿児島:45,沖縄:46 }, _prefix: true

  enum Birthplace: {北海道:0,青森:1,岩手:2,宮城:3,秋田:4,山形:5,福島:6,
                    茨城:7,栃木:8,群馬:9,埼玉:10,千葉:11,東京:12,神奈川:13,
                    新潟:14,富山:15,石川:16,福井:17,山梨:18,長野:19,岐阜:20,
                    静岡:21,愛知:22,三重:23, 滋賀:24,京都:25,大阪:26,兵庫:27,
                   奈良:28,和歌山:29,鳥取:30,島根:31,岡山:32,広島:33,山口:34,
                    徳島:35,香川:36,愛媛:37,高知:38,福岡:39,佐賀:40,長崎:41,
                    熊本:42,大分:43,宮崎:44,鹿児島:45,沖縄:46 }, _prefix: true
                    
  enum work: {上場企業:0,金融:1,公務員:2,コンサル:3,経営者・役員:4,大手企業:5,大手外資:6,
                    大手商社:7,外資金融:8,医師:9,看護師:10,薬剤師:11,弁護士:12,公認会計士:13,
                    パイロット:14,客室乗務員:15,広告:16,マスコミ:17,教育関連:18,IT関連:19,食品関連:20,
                    旅行関係:21,製薬:22,保険:23,不動産:24,建築関連:25,通信:26,流通:27,
                    WEB関連:28,ブライダル:29,クリエイター:30,接客業:31,受付:32,調理師・栄養士:33,アパレル・ショップ:34,
                    美容関係:35,エンターテインメント:36,アナウンサー:37,芸能・モデル:38,イベントコンパニオン:39,スポーツ選手:40,秘書:41,
                    事務員:42,福祉・介護:43,保育士:44,会社員:45,学生:46,自由業:47,税理士:48,
                    エンジニア:49,建築士:50,美容師:51,歯科医師:52,歯科衛生士:53,その他:54 }
                    
  enum holiday: {土日: 0, 平日: 1, 不定期: 2, その他: 3 }, _prefix: true
  
private

    # メールアドレスをすべて小文字にする
    def downcase_email
      self.email = email.downcase
    end

    # 有効化トークンとダイジェストを作成および代入する
    def create_activation_digest
      self.activation_token  = User.new_token
      self.activation_digest = User.digest(activation_token)
    end

end
