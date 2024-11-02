class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true, match:(/@.+/)
  validates :password, presence: true,confirmation: true, match: (/[a-z\d]{6,}/i) 
  validates :password_confirmation, presence: true
       
end