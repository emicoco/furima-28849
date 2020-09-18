class Buyer < ApplicationRecord
  # attr_accessor :post_number, :shipping_origin_area_id, :city, :address, :tel, :building_name, :user_id, :item_id, :token
  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :shipping_origin_area

  belongs_to :purchase_management
end
