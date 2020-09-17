class Token

  include ActiveModel::Model
  attr_accessor :presence, :purchase_management, :post_number, :prefecture, :city, :address, :tel, :building_name, :user, :item
  with_options presence: true do
    validates :purchase_management
    validates :post_number
    validates :prefecture
    validates :city
    validates :address
    validates :tel
    validates :token
  end

  validates :post_number, format:{ with: /\A\d{3}[-]\d{4}\z/ }
  validates :tel, format:{ with: /\A\d{11}\z/}

  def save
    purchase_management = PurchaseManagement.create(user: user, item: item)
    Buyer.create(post_number: post_number, prefecture: prefecture, city: city, address: address, building_name: building_name, tel: tel, purchase_management: purchase_management.id)
  end
end