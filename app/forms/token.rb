class Token

  include ActiveModel::Model
  attr_accessor :post_number, :shipping_origin_area_id, :city, :address, :tel, :building_name, :user_id, :item_id, :token
  with_options presence: true do
    validates :post_number
    validates :shipping_origin_area_id, numericality: { other_than: 0 }
    validates :city
    validates :address
    validates :tel
    validates :token

  end

  validates :post_number, format:{ with: /\A\d{3}[-]\d{4}\z/ }
  validates :tel, format:{ with: /\A\d{11}\z/}

  def save
    purchase_management = PurchaseManagement.create(user_id: user_id, item_id: item_id)
    Buyer.create(post_number: post_number, shipping_origin_area_id: shipping_origin_area_id, city: city, address: address, building_name: building_name, tel: tel, purchase_management_id: purchase_management.id)
  end
end