class Buyer < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_origin_area

  belongs_to :purchase_management
end
