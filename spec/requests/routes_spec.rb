require 'rails_helper'

RSpec.describe "Routes", type: :request do
  before do
    @route = FactoryBot.create(:route)
  end

  describe "GET #index" do
    it "indexアクションにリクエストすると正常にレスポンスが返ってくる" do 
      get root_path
      expect(response.status).to eq 200
    end
    it "indexアクションにリクエストするとレスポンスに投稿済みのルートのタイトルが存在する" do
      get root_path
      expect(response.body).to include @route.title
    end
    it "indexアクションにリクエストするとレスポンスに投稿検索フォームが存在する" do
      get root_path
      expect(response.body).to include "投稿を検索する"
    end
  end
end
