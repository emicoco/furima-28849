class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comments
  has_many :likes
  has_one :purchase_management

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_method
  belongs_to_active_hash :shipping_origin_area
  belongs_to_active_hash :shipping_days

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :status_id
    validates :shipping_method_id
    validates :shipping_origin_area_id
    validates :shipping_days_id
  end

  with_options presence: true do
    validates :price
    validates :description
    validates :user_id
    validates :name
    validates :description
    validates :image
  end

  validates :price, numericality: { only_integer: true }, inclusion: { in: 300..9_999_999 }

  def was_attached?
    image.attached?
  end
end
