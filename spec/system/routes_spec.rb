require 'rails_helper'

RSpec.describe "ルートの投稿", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @route = FactoryBot.build(:route)
  end

  context 'ルートの投稿ができるとき'do
    it 'ログインしたユーザーは新規投稿できる' do
      # ログインする
      visit new_user_session_path
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 新規投稿ページへのリンクがあることを確認する
      expect(page).to have_content('新規投稿')
      # 投稿ページに移動する
      visit new_route_path
      # フォームに情報を入力する
      fill_in 'タイトル', with: @route.title
      fill_in 'ルート詳細', with: @route.text 
      select '近道', from: 'route[category_id]'
      select '指定なし', from: 'route[city_id]'
      # 添付する画像を定義する
      image_path = Rails.root.join('public/images/test_image.png')
      # 画像選択フォームに画像を添付する
      attach_file('route[image]',image_path,make_visible: true)
      # 送信するとRouteモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Route.count }.by(1)
      # トップページに遷移する
      visit root_path
      # トップページには先ほど投稿した内容のルートが存在することを確認する（画像）
      expect(page).to have_selector('img')
      # トップページには先ほど投稿した内容のルートが存在することを確認する（タイトル）
      expect(page).to have_content(@route.title)
    end
  end
  context 'ルートの投稿ができないとき'do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      # トップページに遷移する
      visit root_path
      # 新規投稿ページへのリンクがない
      expect(page).to have_no_content('新規投稿')
    end
  end
end

RSpec.describe 'ルート編集', type: :system do
  before do
    @route1 = FactoryBot.create(:route)
  end
  context 'ルート編集ができるとき' do
    it 'ログインしたユーザーは自分が投稿したルートの編集ができる' do
      # ルート1を投稿したユーザーでログインする
      visit new_user_session_path
      fill_in 'メールアドレス', with: @route1.user.email
      fill_in 'パスワード', with: @route1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # ルート1に詳細ページに遷移するためのタイトルがあることを確認する
      click_link '＜タイトル＞'
      # 詳細ページへ遷移する
      visit route_path(@route1)
      # ルート1の詳細ページに「編集」ボタンがあることを確認する
      expect(page).to have_link '編集', href: edit_route_path(@route1)
      # 編集ページへ遷移する
      visit edit_route_path(@route1)
      # すでに投稿済みの内容がフォームに入っていることを確認する
      expect(
        find('#route_title').value # tweet_imageというid名が付与された要素の値を取得
      ).to eq @route1.title
      expect(
        find('#route_text').value # tweet_textというid名が付与された要素の値を取得
      ).to eq @route1.text
      expect(
        find('#item-category').value # tweet_imageというid名が付与された要素の値を取得
      ).to eq "#{@route1.category_id}"
      expect(
        find('#item-sales-status').value # tweet_textというid名が付与された要素の値を取得
      ).to eq "#{@route1.city_id}"
      # 投稿内容を編集する
      fill_in 'タイトル', with: @route1.title
      fill_in 'ルート詳細', with: @route1.text 
      select '近道', from: 'route[category_id]'
      select '指定なし', from: 'route[city_id]'
      # 添付する画像を定義する
      image_path = Rails.root.join('public/images/test_image.png')
      # 画像選択フォームに画像を添付する
      attach_file('route[image]',image_path,make_visible: true)
      # 編集してもRouteモデルのカウントは変わらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Route.count }.by(0)
      # 詳細画面に遷移する
      visit route_path(@route1)
      # トップページには先ほど変更した内容のルートが存在することを確認する（画像）
      expect(page).to have_selector('img')
      # トップページには先ほど変更した内容のルートが存在することを確認する（タイトル）
      expect(page).to have_content(@route1.title)
    end
  end
  context 'ルート編集ができないとき' do
    #it 'ログインしたユーザーは自分以外が投稿したルートの編集画面には遷移できない' do
      # ルート1を投稿したユーザーでログインする
      #visit new_user_session_path
      #fill_in 'メールアドレス', with: @route1.user.email
      #fill_in 'パスワード', with: @route1.user.password
      #find('input[name="commit"]').click
      #expect(current_path).to eq root_path
      # ルート1に詳細ページに遷移するためのタイトルがあることを確認する
      #click_link '＜タイトル＞'
      # 詳細ページへ遷移する
      #visit route_path(@route2)
      # ルート2に「編集」ボタンがないことを確認する
      #expect(page).to have_no_link '編集', href: edit_route_path(@route2)
    #end
    it 'ログインしていないとルートの編集画面には遷移できない' do
      # トップページにいる
      visit root_path
      # ログインしていない状態でクリックする
      click_link '＜タイトル＞'
      # ログインページに遷移する
      visit new_user_session_path
    end
  end
end
