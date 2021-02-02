require 'rails_helper'

RSpec.describe Route, type: :model do
  before do
    @ruote = FactoryBot.build(:route)
  end
  describe '投稿の保存' do

    context '投稿が成功する場合' do

      it '全ての項目の入力ができていれば投稿できる' do
        expect(@route).to be_valid
      end
      it '地域の指定がなくても投稿できる' do
        @route.city_id = 0
        expect(@route).to be_valid
      end
    end

    context '投稿が失敗する場合' do
      it '投稿画像がないと投稿できない' do
        @route.image = nil
        @route.valid?
        expect(@route.errors.full_messages).to include("画像を入力してください")
      end
      it 'ユーザーと投稿が紐付いていないと投稿できない' do
        @route.user = nil
        @route.valid?
        expect(@route.errors.full_messages).to include("Userを入力してください")
      end
      it 'タイトルがないと投稿できない' do
        @route.title = ""
        @route.valid?
        expect(@route.errors.full_messages).to include("投稿名を入力してください")
      end
      it 'ルート詳細がないと投稿できない' do
        @route.text = ""
        @route.valid?
        expect(@route.errors.full_messages).to include("投稿の説明を入力してください")
      end
      it 'カテゴリーの情報がないと投稿できない' do
        @route.category_id = 0
        @route.valid?
        expect(@route.errors.full_messages).to include("カテゴリーを選択してください")
      end
    end
  end
end
