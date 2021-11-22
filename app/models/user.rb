class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

       with_options presence: true do
         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX
         validates :nickname, presence: true
         validates :email, uniqueness: true
         validates :family_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
         validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
         validates :family_name_kana, format: { with: /\A[\p{katakana}ー－&&[^ -~｡-ﾟ]]+\z/ }
         validates :first_name_kana, format: { with: /\A[\p{katakana}ー－&&[^ -~｡-ﾟ]]+\z/ }
         validates :birth_day
       end
        
end
