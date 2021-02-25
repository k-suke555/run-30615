class Area < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '中央区' },
    { id: 3, name: '博多区' },
    { id: 4, name: '東区' },
    { id: 5, name: '南区' },
    { id: 6, name: '上記以外' },
  ]

  include ActiveHash::Associations
  has_many :articles
  
end