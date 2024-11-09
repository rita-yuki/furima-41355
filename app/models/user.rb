class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A.+@.+\z/, message: 'must contain an @ symbol' } 
  
  PASSWORD_REGEX = /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/.freeze
  validates :password, length: { minimum: 6 }, format: { with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' }, confirmation: true

  with_options presence: true do
  validates :family_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
  validates :name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
  validates :kana_family_name, format: { with: /\A[ァ-ヶ一ー]+\z/, message: '全角カタカナを使用してください' }
  validates :kana_name, format: { with: /\A[ァ-ヶ一ー]+\z/, message: '全角カタカナを使用してください' }
  validates :birthday
  end
end
