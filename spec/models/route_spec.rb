require 'rails_helper'

RSpec.describe Route, type: :model do
  before do
    @route = FactoryBot.build(:route)
  end
  describe 'ルート投稿機能' do

    context 'ルート投稿が成功する場合' do

      it '全ての項目の入力ができていれば投稿ができる' do
        expect(@route).to be_valid
      end
      it '地域が指定なしでも投稿できる' do
        @route.city_id = 0
        expect(@route).to be_valid
      end
    end

    context 'ルート投稿が失敗する場合' do
      it '画像がないと投稿できない' do
        @route.image = nil
        @route.valid?
        expect(@route.errors.full_messages).to include "Image can't be blank"
      end
      it 'ユーザーと紐付いていないと投稿できない' do
        @route.user = nil
        @route.valid?
        expect(@route.errors.full_messages).to include "User must exist"
      end
      it 'タイトルがないと投稿できない' do
        @route.title = ""
        @route.valid?
        expect(@route.errors.full_messages).to include "Title can't be blank"
      end
      it 'ルート詳細がないと投稿できない' do
        @route.text = ""
        @route.valid?
        expect(@route.errors.full_messages).to include "Text can't be blank"
      end
      it 'カテゴリーの情報がないと投稿できない' do
        @route.category_id = 0
        @route.valid?
        expect(@route.errors.full_messages).to include "Category must be other than 0"
      end
    end
  end
end
