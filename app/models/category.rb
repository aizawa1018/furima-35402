class category < ActiveHash::Base
  self.data = [
    {id: 0, name: 'レディース'}, {id: 1, name: 'メンズ'}, {id: 2, name: 'ベビー・キッズ'}, 
    {id: 3, name: 'インテリア・すまい住まい・小物'}、 {id: 4, name: '本・音楽・ゲーム'}, {id: 5, name: '家電・スマホ・カメラ'}, 
    {id: 6, name: 'スポーツ・レジャー'}, {id: 7, name: 'ハンドメイド'}, {id: 8, name: 'その他'}
  end
