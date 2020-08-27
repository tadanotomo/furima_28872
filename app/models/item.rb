class Item < ApplicationRecord
  belongs_to :user
  has_one :purchaser
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :sipping
  belongs_to_active_hash :sipping_origin
  belongs_to_active_hash :sipping_date
  validates :name, :image, :category_id, :status_id, :sipping_id, :sipping_origin_id, :sipping_date_id, :price, :description, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
  validates :price, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters.' }
end
