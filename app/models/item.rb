class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comments
  has_many :likes
  has_one :purchase_manegement

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_method
  belongs_to_active_hash :shipping_origin_area
  belongs_to_active_hash :shipping_day

  # vzalidates :description, :price, presence: true
  validates :category_id, numericality: { other_than: 0 }
  validates :status_id, numericality: { other_than: 0 }
  validates :shipping_method_id, numericality: { other_than: 0 }
  validates :shipping_origin_area_id, numericality: { other_than: 0 }
  validates :shipping_days_id, numericality: { other_than: 0 }
  validates :price, presence: true
  validates :price, numericality: { only_integer: true }, inclusion: { in: 300..9_999_999 }
  validates :description, presence: true
  validates :user_id, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true

  def was_attached?
    image.attached?
  end
end
