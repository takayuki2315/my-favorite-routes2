require 'rails_helper'

RSpec.describe 'コメント投稿', type: :system do
  before do
    @route = FactoryBot.create(:route)
    @comment = Faker::Lorem.sentence
  end

  it 'ログインしたユーザーはルート詳細ページでコメント投稿できる' do
    # ログインする
    visit new_user_session_path
      fill_in 'メールアドレス', with: @route.user.email
      fill_in 'パスワード', with: @route.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
    # ルートに詳細ページに遷移するためのタイトルがあることを確認する
    click_link '＜タイトル＞'
    # 詳細ページへ遷移する
    visit route_path(@route)
    # フォームに情報を入力する
    fill_in 'comment_text', with: @comment
    # コメントを送信すると、Commentモデルのカウントが1上がることを確認する
    expect{
      find('input[name="commit"]').click
    }.to change { Comment.count }.by(1)
    # 詳細ページにリダイレクトされることを確認する
    expect(current_path).to eq(route_path(@route))
    # 詳細ページ上に先ほどのコメント内容が含まれていることを確認する
    expect(page).to have_content @comment
  end
end
