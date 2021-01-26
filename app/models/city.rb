class City < ActiveHash::Base
  self.data = [
    {id: 0, name: '指定なし'}, {id: 1, name: '足立区'}, {id: 2, name: '荒川区'}, 
    {id: 3, name: '板橋区'}, {id: 4, name: '江戸川区'}, {id: 5, name: '大田区'}, 
    {id: 6, name: '葛飾区'}, {id: 7, name: '北区'}, {id: 8, name: '江東区'}, 
    {id: 9, name: '品川区'}, {id: 10, name: '渋谷区'}, {id: 11, name: '新宿区'}, 
    {id: 12, name: '杉並区'}, {id: 13, name: '墨田区'}, {id: 14, name: '世田谷区'}, 
    {id: 15, name: '台東区'}, {id: 16, name: '千代田区'}, {id: 17, name: '中央区'}, 
    {id: 18, name: '豊島区'}, {id: 19, name: '中野区'}, {id: 20, name: '練馬区'}, 
    {id: 21, name: '文京区'}, {id: 22, name: '港区'}, {id: 23, name: '目黒区'}, 
    {id: 24, name: '昭島市'}, {id: 25, name: 'あきる野市'}, {id: 26, name: '稲城市'}, 
    {id: 27, name: '青梅市'}, {id: 28, name: '清瀬市'}, {id: 29, name: '国立市'}, 
    {id: 30, name: '小金井市'}, {id: 31, name: '国分寺市'}, {id: 32, name: '小平市'}, 
    {id: 33, name: '狛江市'}, {id: 34, name: '立川市'}, {id: 35, name: '多摩市'}, 
    {id: 36, name: '調布市'}, {id: 37, name: '西東京市'}, {id: 38, name: '八王子市'}, 
    {id: 39, name: '羽村市'}, {id: 40, name: '東久留米市'}, {id: 41, name: '東村山市'}, 
    {id: 42, name: '東大和市'}, {id: 43, name: '日野市'}, {id: 44, name: '府中市'}, 
    {id: 45, name: '福生市'}, {id: 46, name: '町田市'}, {id: 47, name: '三鷹市'},
    {id: 48, name: '武蔵野市'}, {id: 49, name: '武蔵村山市'}, {id: 50, name: '大島町'}, 
    {id: 51, name: '奥多摩町'}, {id: 52, name: '八丈町'}, {id: 53, name: '日の出町'}, 
    {id: 54, name: '瑞穂町'}, {id: 55, name: '青ヶ島村'}, {id: 56, name: '小笠原村'},
    {id: 57, name: '神津島村'}, {id: 58, name: '利島村'}, {id: 59, name: '新島村'}, 
    {id: 60, name: '檜原村'}, {id: 61, name: '御蔵島村'}, {id: 62, name: '三宅村'}
]
include ActiveHash::Associations
has_many :routes
end