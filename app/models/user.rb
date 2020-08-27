class User < ApplicationRecord
  has_many :items
  has_one :purchaser

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  VALID_EMAIL_REGEX = /\A[0-9a-z+\-.]+@[a-z\d\-.]+\.[a-z]+\z/.freeze
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/.freeze
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  VALID_KANANAME_REGEX = /\A[ァ-ヶー－]+\z/.freeze

  validates :nickname, :email, :password, :password_confirmation, :last_name, :first_name, :last_name_kana, :first_name_kana,
            :birthday, presence: true
  validates :email, format: { with: VALID_EMAIL_REGEX, message: 'is invalid', allow_blank: true },
                    uniqueness: { case_sensitive: false }
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'is invalid' }
  validates :last_name, :first_name, format: { with: VALID_NAME_REGEX, message: 'is invalid' }
  validates :last_name_kana, :first_name_kana, format: { with: VALID_KANANAME_REGEX, message: 'is invalid' }
end
