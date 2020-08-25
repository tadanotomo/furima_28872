class User < ApplicationRecord
  before_save { self.email = email.downcase }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i
  VALID_NAME_REGEX /\A[ぁ-んァ-ン一-龥]+\z/
  VALID_KANANAME_REGEX = /\A[ァ-ヶー－]+\z/

  validates :nickname, :password, :last_name, :first_name, :last_name_kana, :first_name_kana,
            :birthday, presence: true
  validates :email, format: { with: VALID_EMAIL_REGEX , allow_blank: true },
            uniqueness: { case_sensitive: false }
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  validates :last_name, :first_name, format: { with: VALID_NAME_REGEX }
  validates :last_name_kana, :first_name_kana, format: { with: VALID_KANANAME_REGEX }
end