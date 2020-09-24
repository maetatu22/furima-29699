class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :buyers
         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i
         NAME_REGIX = /\A[ぁ-んァ-ン一-龥]/
         NAME_KANA_REGIX = /\A[ァ-ヶー－]+\z/

      with_options presence: true do
         validates :nickname
         validates :last_name, format:  { with: NAME_REGIX, message: "Full-width characters"}
         validates :first_name, format:  { with: NAME_REGIX, message: "Full-width characters"}
         validates :last_name_kana, format:  { with: NAME_KANA_REGIX, message: "Full-width katakana characters"}
         validates :first_name_kana, format:  { with: NAME_KANA_REGIX, message: "Full-width katakana characters"}
         validates :birthday
         validates :password,format:  { with: PASSWORD_REGEX, message: "Password Include both letters and numbers"}
      end
   
end
