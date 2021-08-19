# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 追加のユーザーをまとめて生成する

User.create!(name:  "青木 駿太",
             email: "hayata@railstutorial.org",
             password:              "Apple0713",
             password_confirmation: "Apple0713",
             age: 23,
             sex: 0,
             residence: 26,
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

             
User.create!(name:  "ゲスト様",
             email: "guest@example.com",
             password:              "Apple0713",
             password_confirmation: "Apple0713",
             age: 33,
             sex: 0,
             residence: 27,
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)
             
User.create!(name:  "ゆっきー",
             email: "yukkiy@example.com",
             password:              "Apple0713",
             password_confirmation: "Apple0713",
             age: 25,
             sex: 0,
             residence: 27,
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "Apple0713"
  User.create!(name:  name,
              email: email,
              password:              password,
              password_confirmation: password,
              age: 23,
              sex: 1,
              residence: 26,
              activated: true,
              activated_at: Time.zone.now)
end

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
#following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

guest_user  = User.find(1)
following.each { |followed| guest_user.follow(followed) }
followers.each { |follower| follower.follow(guest_user) }


community = Category.create(name: 'コミュニティ')

hobby, life_style, values = community.create(
    [
        { name: '趣味' },
        { name: 'ライフスタイル' },
        { name: '価値観' }
    ])
    

music, game = hobby.children.create(
    [
        { name: '音楽' },
        { name: 'ゲーム' }
    ])
    
['Youtubeが好き', 'カラオケが好き', 'バイオリンにハマってます'].each do |name|
  music.children.create(name: name)
end

['Apex Legends', 'ポケモン', 'PS4'].each do |name|
  game.children.create(name: name)
end    
    

job, health = life_style.children.create(
    [
        { name: '仕事' },
        { name: '美容・健康' }
    ])

['Webエンジニア', '経理', 'タクシードライバー'].each do |name|
  job.children.create(name: name)
end

['アンチエイジング', '毎日プロテインを飲んでます', '健康オタクです'].each do |name|
  health.children.create(name: name)
end    
    

love, personality = values.children.create(
    [
        { name: '恋愛・結婚' },
        { name: '性格' }
    ])
['忙しくても大切な人との時間は大切にしたい', '結婚を考えられる人とお付き合いしたい', '好きになるとトコトン一途'].each do |name|
  love.children.create(name: name)
end

['一人の時間も大事にしたい', '笑顔が好き', 'ゴロゴロするのが好き'].each do |name|
  personality.children.create(name: name)
end    
    



