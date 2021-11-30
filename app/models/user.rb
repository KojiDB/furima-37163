class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birth_day
  end
  validates :email, uniqueness: true

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'Password is invalid. Include both letters and numbers' }
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } do
    validates :last_name, format: { message: 'Last name is invalid. Input full-width characters'}
    validates :first_name, format: { message: 'First name is invalid. Input full-width characters'}
  end
  with_options presence: true, format: { with: /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/ } do
    validates :last_name, format: { message: 'Last name kana is invalid. Input full-width katakana characters'}
    validates :first_name, format: { message: 'First name kana is invalid. Input full-width katakana characters'}
  end
end
