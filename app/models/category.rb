class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: 'お気に入りルート' },
    { id: 2, name: '近道' },
    { id: 3, name: '散歩、ジョギングルート' },
    { id: 4, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :routes
  
end
