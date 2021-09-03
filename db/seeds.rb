
User.create!(name:  "Aoki", email: "hayata@railstutorial.org",password: "Apple0713", password_confirmation: "Apple0713", age: 23, sex: 0,
             residence: 26, blood_type: 1, Birthplace: 20, work: 20, holiday: 3, height: 173,
             content: "はじめまして、プロフィールを見て頂きありがとうございます。真剣な出会いを探そうと、思い切ってペアーズに登録してみました！
                        【お仕事】
                        お仕事はWebデザイナーをしており、企業や個人などのクライアントから依頼されたWebサイトのデザインを担当しています。職場の環境や人間関係が良く、デザイナーは将来性もあるため、日々デザインの勉強もしながら楽しくお仕事をさせて頂いています。
                        【趣味】
                        趣味は美味しい物を食べたり、ドライブしながら海や山などの綺麗な景色を見に行くのが好きです。あと映画やドラマも家でよく観たりします！
                        好きな食べ物はお肉・お魚で、仕事の帰りに友人とお酒を飲みながら料理を楽しんだりします。映画やドラマはNetflixで見ることが多く、海外ドラマにハマり過ぎて1日中見ていることもあります。ちなみに最近好きなのはウォーキング・デットのシリーズです！
                        【オフの過ごし方】
                        休日は家でゆっくり読書を楽しみ、ドライブが好きなので神社巡りやその近くにある美味しいカフェでまったりと過ごすこともあります！
                        ペアーズで良い人に出会えた際には、一緒にたくさんお出かけしたり、趣味を共有し合ったりと、お互いを尊重し合える関係になれたら良いなーと思っています。
                        ゆくゆくはお互いの将来のことも視野に入れて、結婚を考えられる方も探しています。
                        もし少しでも興味を持って頂けたら、いいねを送っていただけると嬉しいです。", admin: true, activated: true, activated_at: Time.zone.now)
             
User.create!(name:  "ゲスト様", email: "guest@example.com", password: "Apple0713", password_confirmation: "Apple0713", age: 33, sex: 0,
             residence: 27, blood_type: 1, Birthplace: 20,  work: 20, holiday: 3,
             height: 170,
             content: "はじめまして、プロフィールを見て頂きありがとうございます。真剣な出会いを探そうと、思い切ってペアーズに登録してみました！
                        【お仕事】
                        お仕事はWebデザイナーをしており、企業や個人などのクライアントから依頼されたWebサイトのデザインを担当しています。職場の環境や人間関係が良く、デザイナーは将来性もあるため、日々デザインの勉強もしながら楽しくお仕事をさせて頂いています。
                        【趣味】
                        趣味は美味しい物を食べたり、ドライブしながら海や山などの綺麗な景色を見に行くのが好きです。あと映画やドラマも家でよく観たりします！
                        好きな食べ物はお肉・お魚で、仕事の帰りに友人とお酒を飲みながら料理を楽しんだりします。映画やドラマはNetflixで見ることが多く、海外ドラマにハマり過ぎて1日中見ていることもあります。ちなみに最近好きなのはウォーキング・デットのシリーズです！
                        【オフの過ごし方】
                        休日は家でゆっくり読書を楽しみ、ドライブが好きなので神社巡りやその近くにある美味しいカフェでまったりと過ごすこともあります！
                        ペアーズで良い人に出会えた際には、一緒にたくさんお出かけしたり、趣味を共有し合ったりと、お互いを尊重し合える関係になれたら良いなーと思っています！
                        ゆくゆくはお互いの将来のことも視野に入れて、結婚を考えられる方も探しています。
                        もし少しでも興味を持って頂けたら、いいねを送っていただけると嬉しいです。", admin: true, activated: true, activated_at: Time.zone.now)

User.create!(name: "ゆっきー", email: "yukkiy@example.com", password: "Apple0713", password_confirmation: "Apple0713", age: 25, sex: 1,
             residence: 27, image: "woman.jpg", blood_type: 1, Birthplace: 20, work: 20, holiday: 3,
             height: 163, admin: true,activated: true, activated_at: Time.zone.now)
User.create!(name:  "葵", email: "aoaoao@example.com", password: "Apple0713", password_confirmation: "Apple0713",
             age: 20, sex: 1, residence: 20, image: "woman1.jpg", blood_type: 3, Birthplace: 20,
             work: 40, holiday: 1, height: 155, admin: true, activated: true, activated_at: Time.zone.now,
             tweet: "アニソン好きな人と繋がりたい！")
             
User.create!(name:  "あみ", email: "amiami@example.com", password: "Apple0713", password_confirmation: "Apple0713",
             age: 22, sex: 1, residence: 19, image: "woman2.jpg", blood_type: 3, Birthplace: 19,
             work: 40, holiday: 3, height: 167, admin: true, activated: true, activated_at: Time.zone.now,
             tweet: "誠実でリードしてくれる男性がタイプです！")

User.create!(name:  "美佐子", email: "isonomisako@example.com", password: "Apple0713", password_confirmation: "Apple0713",
             age: 25, sex: 1, residence: 10,  image: "woman3.jpg",blood_type: 0, Birthplace: 13,
             work: 13, holiday: 0, height: 164, admin: true, activated: true, activated_at: Time.zone.now,
             tweet: "結婚を前提にお付き合いできる方を探してます！")

User.create!(name:  "Risa", email: "risa@example.com", password: "Apple0713", password_confirmation: "Apple0713",
             age: 26, sex: 1, residence: 27, image: "woman4.jpg", blood_type: 1, Birthplace: 20,
             work: 20, holiday: 3, height: 163, admin: true, activated: true, activated_at: Time.zone.now,
             tweet: "カットモデルをしています！")

User.create!(name:  "まり", email: "mari@example.com", password: "Apple0713", password_confirmation: "Apple0713",
             age: 24, sex: 1, image: "woman5.jpg",  residence: 27, blood_type: 1, Birthplace: 12,
             work: 12, holiday: 3, height: 153, admin: true, activated: true, activated_at: Time.zone.now,
             tweet: "お話ししましょ！")

User.create!(name:  "みなみ", email: "minaminami@example.com", password: "Apple0713", password_confirmation: "Apple0713",
             age: 25, sex: 1, residence: 27,image: "woman6.jpg",  blood_type: 1, Birthplace: 20,
             work: 20, holiday: 3, height: 163, admin: true, activated: true, activated_at: Time.zone.now, 
             tweet: "クールに見られますが、意外とゲラです")

User.create!(name:  "エマーソン", email: "emasonemason@example.com", password: "Apple0713", password_confirmation: "Apple0713",
             age: 32, sex: 1, image: "woman7.jpg", residence: 10, blood_type: 2, Birthplace: 22,
             work: 2, holiday: 0, height: 159, admin: true, activated: true, activated_at: Time.zone.now)

# 追加のユーザーをまとめて生成する
Community.create!(name: "Apex Legends", content: "Apex好きが集まるコミュニティ",image: "apex.jpg", category: 0, genre:0)

Community.create!(name: "Youtubeをよく見ます！", content: "Youtube好きが集まるコミュニティ", image: "youtube.jpg", category: 0, genre:1)

Community.create!(name: "Photoshopを使ったことがあります！", content: "Photoshopコミュニティ", image: "photoshop.jpg", category: 1, genre:4)
             
Community.create!(name: "Reactを実務で使っています！", content: "Reactを使ったことがあるコミュニティ", image: "react.jpg", category: 1,genre:4)
             
Community.create!(name: "AWSの資格を持っています！", content: "AWSの資格を持っているコミュニティ", image: "aws.jpg", category: 1, genre:4)
             
Community.create!(name: "Vue.jsをフロントエンドに使っています！", content: "Vue.jsをフロントエンドに使ったコミュニティ",image: "vue.jpg", category: 1, genre:4)

Community.create!(name: "プログラミング言語に興味があります！", content: "プログラミング言語に興味があるコミュニティ", image: "language-p.jpg", category: 1, genre:4)
             
Community.create!(name: "経理・財務を担当していました！", content: "経理・財務担当のコミュニティ", image: "keiri.jpg", category: 1, genre:4)
             
Community.create!(name:  "スーツ好き！", content: "スーツ好きのコミュニティ", image: "suit.jpg", category: 1, genre:9)
             
Community.create!(name:  "スタバによく行きます！", content: "スタバに良く行く人のコミュニティ", image: "sutaba.jpg", category: 0, genre:7)

Community.create!(name:  "タクシードライバーをしていました！", content: "タクシードライバーのコミュニティ", image: "taxi.jpg", category: 0, genre:4)
             
Community.create!(name:  "テニスが好き！", content: "テニス好きのコミュニティ", image: "tennis.jpg", category: 0, genre:6)
             
Community.create!(name:  "歳を取ってもずっと一緒", content: "老後も一緒に居たい人向けのコミュニティ", image: "grand-love.jpg",category: 2, genre:2)

Community.create!(name:  "ドラクエが大好き！", content: "", image: "draqe.jpg",category: 0, genre:0)
Community.create!(name:  "MHW", content: "", image: "monster.jpg",category: 0, genre:0)
Community.create!(name:  "結婚を前提にお付き合い", content: "", image: "marry.jpg",category: 2, genre:2)
Community.create!(name:  "綺麗な海を見たい！", content: "", image: "sea.jpg",category: 0, genre:11)
Community.create!(name:  "カメラ・写真が好き", content: "", image: "camera.jpg",category: 0, genre:11)
Community.create!(name:  "インスタグラム", content: "", image: "insta.jpg",category: 0, genre:11)


99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "Apple0713"
  User.create!(name:  name, email: email, password: password, password_confirmation: password, age: 20, sex: 1, residence: 26, blood_type: 1,
              Birthplace: 20, work: 20, holiday: 3, height: 161, activated: true, activated_at: Time.zone.now)
end


users = User.all
users.each {|user| user.join(Community.first)}
user  = users.first
guest_user  = User.second
following = users[2..50]
followers = users[3..40]
following.each { |followed| guest_user.follow(followed) }
followers.each { |follower| follower.follow(guest_user) }


#following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }





             


    



