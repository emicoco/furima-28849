require 'rails_helper'
describe Item do
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: user.id)
  end

  describe '商品出品機能' do
    context '商品の出品がうまくいくとき' do
      it '画像が1枚必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'name、description、category、status、shipping_method、shipping_area、shipping_days、price、が必須であること' do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'nameが空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空だと登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'priceが空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'category_idが0だと登録できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 0')
      end
      it 'status_idが0だと登録できない' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 0')
      end
      it 'shipping_method_idが0だと登録できない' do
        @item.shipping_method_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping method must be other than 0')
      end
      it 'shipping_origin_area_idが0だと登録できない' do
        @item.shipping_origin_area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping origin area must be other than 0')
      end
      it 'shipping_days_idが0だと登録できない' do
        @item.shipping_days_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping days must be other than 0')
      end
      it '画像が無いと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '価格の範囲が¥300~¥9,999,999であること' do
        @item.price = 299
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
    end
  end
end
