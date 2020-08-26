class Item < ApplicationRecord
  belongs_to :user
  has_many :user_items
  has_one :purchaser
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :category, :status, :item, :sipping, :sipping_origin, :sipping_date
    valideates :category, :status, :item, :sipping, :sipping_origin, :sipping_date, presence: true
end
