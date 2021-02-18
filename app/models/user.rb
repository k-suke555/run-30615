class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :parks
  with_options presence: true do
    validates :nickname
    validates :password, format: { with: /\A[a-z0-9]+\z/i }
  end
end
