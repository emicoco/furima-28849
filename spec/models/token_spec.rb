require 'rails_helper'
RSpec.describe Token, type: :model do
  before do
    #user = FactoryBot.create(:user)
    @token = FactoryBot.build(:token)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいかないとき' do
      it 'クレジット情報が空だと購入できない' do
        @token.token = ''
        @token.valid?
        expect(@token.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_numberが空だと購入できない' do
        @token.post_number = nil
        @token.valid?
        expect(@token.errors.full_messages).to include("Post number can't be blank")
      end
      it 'post_numberには-がないと登録できない' do
        @token.post_number = "123/4567"
        @token.valid?
        expect(@token.errors.full_messages).to include("Post number is invalid")
      end
      it 'telが空では購入できない' do
        @token.tel = nil
        @token.valid?
        expect(@token.errors.full_messages).to include("Tel can't be blank")
      end
      it 'telは11桁以内出ないといけない' do
        @token.tel = '111-1111111'
        @token.valid?
        expect(@token.errors.full_messages).to include("Tel is invalid")
      end
      it '都道府県が空では登録できない' do
        @token.shipping_origin_area_id = "0"
        @token.valid?
        expect(@token.errors.full_messages).to include("Shipping origin area must be other than 0")
      end
      it '市区町村がからでは登録できない' do
        @token.city = nil
        @token.valid?
        expect(@token.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空でないと登録できない' do
        @token.address = nil
        @token.valid?
        expect(@token.errors.full_messages).to include("Address can't be blank")
      end
      
    end
  end
end