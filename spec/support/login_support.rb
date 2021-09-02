module LoginSupport
  def valid_login(user)
    visit root_path
    click_link "ログインする"
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログインする"
  end
  
  def visit_login(user)
    visit login_path
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログインする"
  end
  
  def visit_community(user)
    visit login_path
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログインする"
    visit community_path(user)
  end
  
  def visit_index(user)
    visit login_path
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログインする"
    visit index_path(user)
  end
  
  def visit_matching(user)
    visit login_path
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログインする"
    visit match_path(user)
  end
  
end

# LoginSupportモジュールをincludeする
RSpec.configure do |config|
  config.include LoginSupport
end